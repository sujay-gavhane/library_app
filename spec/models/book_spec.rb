# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:new_user) { create(:user) }
  let(:book1) { create(:book, library: library1) }
  let(:book2) { create(:book, library: library2) }

  let(:library1) { create(:library, users: [user1]) }
  let(:library2) { create(:library, users: [user2]) }

  let(:book_name) { 'test' }
  let(:model) { described_class.new(name: book_name, description: '', status: 'available', library: library1) }
  let(:checked_out_book) { described_class.create(name: book_name, description: '', status: 'checked_out', library: library1, user: user1) }
  it { is_expected.to validate_presence_of(:name) }  
  it { is_expected.to validate_uniqueness_of(:name) }  
  it { is_expected.to belong_to(:library).required }
  it { is_expected.to belong_to(:user).optional }

  describe '#is_book_already_assigned' do
    context 'when book and user belongs to different libraries' do
      before do
        checked_out_book.user_and_book_belongs_to_same_library(user2)
      end

      it 'return error message' do
        expect(checked_out_book.errors.full_messages[0]).to eq('User and Book does not belong to same Library.')
      end
    end
  end

  describe '#user_and_book_belongs_to_same_library' do
    context 'when Book is already assigned to user' do
      before do
        checked_out_book.is_book_already_assigned
      end

      it 'return error message' do
        expect(checked_out_book.errors.full_messages[0]).to eq('Book is already assigned to User.')
      end
    end
  end
end
