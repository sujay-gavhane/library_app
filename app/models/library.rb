class Library < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :books

  validates :name, uniqueness: true, presence: true
end
