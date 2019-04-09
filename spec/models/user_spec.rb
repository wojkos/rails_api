require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'should test that factory is valid' do
      expect(build(:user)).to be_valid
    end

    it 'should validate the presence of login' do
      user = build :user, login: nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:login]).to include('can\'t be blank')
    end

    it 'should validate the presence of provider' do
      user = build :user, provider: nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:provider]).to include('can\'t be blank')
    end

    it 'login should be uniqe' do
      user = create :user
      new_user = build :user, login: user.login
      expect(new_user).not_to be_valid
      new_user.login = 'new_login'
      expect(new_user).to be_valid
    end
  end
end
