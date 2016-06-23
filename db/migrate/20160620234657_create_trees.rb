class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :name
      t.string :species
      t.float :diameter
      t.float :mass
      t.float :co2_removed
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
