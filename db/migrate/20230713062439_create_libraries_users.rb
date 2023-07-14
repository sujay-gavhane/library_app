class CreateLibrariesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries_users, id: false do |t|
      t.belongs_to :library
      t.belongs_to :user

      t.timestamps
    end
  end
end
