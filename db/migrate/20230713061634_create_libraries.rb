class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :description
      t.text :location

      t.timestamps
    end
  end
end
