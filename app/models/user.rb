class User < ApplicationRecord
  has_one :access_token, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :provider, presence: true
  validates :login, presence: true, uniqueness: true
end
