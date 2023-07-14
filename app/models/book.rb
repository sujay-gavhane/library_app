class Book < ApplicationRecord
  belongs_to :library
  belongs_to :user, optional: true

  enum :status, [ :available, :checked_out ]

  validates :name, uniqueness: true, presence: true

  def user_and_book_belongs_to_same_library(user)
    valid = user.libraries.include?(self.library)
    self.errors.add(:base, 'User and Book does not belong to same Library.') unless valid
    valid
  end

  def is_book_already_assigned
    self.errors.add(:base, 'Book is already assigned to User.') if self.checked_out?
    !self.checked_out?
  end
end
