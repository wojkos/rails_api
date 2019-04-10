require 'rails_helper'

describe UserAuthenticator do
  describe '#perform' do
    let(:authenticator) { described_class.new('sample_code') }
    subject { authenticator.perform }

    context 'when code is incorrect' do
      let(:github_error) { double('Sawyer::Resource', error: 'bad_verification_code') }
      before do
        allow_any_instance_of(Octokit::Client).to receive(:exchange_code_for_token).and_return(github_error)
      end

      it 'should raise an error' do
        expect { authenticator.perform }.to raise_error(UserAuthenticator::AuthenticationError)
        expect(authenticator.user).to be_nil
      end
    end

    context 'when code is correct' do
      let(:user_data) { { login: 'jdoe1', name: 'Joe Doe', avatar_url: 'http://example.com/avatar' } }
      before do
        allow_any_instance_of(Octokit::Client).to receive(:exchange_code_for_token).and_return('validaccesstoken')
        allow_any_instance_of(Octokit::Client).to receive(:user).and_return(user_data)
      end

      it 'should save user when does not exist' do
        expect { subject }.to change { User.count }.by(1)
        expect(User.last.name).to eq('Joe Doe')
      end

      it 'should reuse already registered user' do
        user = create :user, user_data
        expect{ subject }.not_to change{ User.count }
        expect(authenticator.user).to eq(user)
      end

      it 'should create and set user\'s access token' do
        expect{ subject }.to change{ AccessToken.count }.by(1)
        expect(authenticator.access_token).to be_present
      end
    end
  end
end