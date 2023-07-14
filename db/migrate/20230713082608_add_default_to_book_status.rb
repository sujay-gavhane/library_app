class AddDefaultToBookStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :status, :integer, default: 0
  end
end
