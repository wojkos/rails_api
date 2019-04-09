class User < ApplicationRecord
  validates :provider, presence: true
  validates :login, presence: true, uniqueness: true
end
