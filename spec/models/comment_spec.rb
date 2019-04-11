require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#validations' do
    it 'should have valid factor' do
      expect(build :comment).to be_valid
    end

    it 'should test presence of attributes' do
      comment = Comment.new
      expect(comment).not_to be_valid
      expect(comment.errors.messages).to include({
        user: ['must exist'],
        article: ['must exist'],
        content: ['can\'t be blank']
      })
    end
  end

  describe '.recent' do
    let(:article) { create :article}
    let!(:old_comment) { create :comment, article: article }
    let!(:newer_comment) { create :comment, article: article }

    it 'should list recent comment first' do
      expect(described_class.recent).to eq([newer_comment, old_comment])
    end

    it 'change order after update' do
      old_comment.update_column :created_at, Time.now
      expect(described_class.recent).to eq([old_comment, newer_comment])
    end
  end
end
