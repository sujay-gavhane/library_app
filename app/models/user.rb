class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :libraries
  has_many :books

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
