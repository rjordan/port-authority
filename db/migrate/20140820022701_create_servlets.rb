class CreateServlets < ActiveRecord::Migration
  def change
    create_table :servlets do |t|
      t.string :name
      t.string :image
      t.timestamps
    end
    add_index :servlets, :name, unique: true
  end
end
