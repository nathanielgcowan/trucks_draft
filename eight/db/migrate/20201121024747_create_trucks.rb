class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :make
      t.string :model
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
