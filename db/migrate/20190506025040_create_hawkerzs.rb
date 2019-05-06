class CreateHawkerzs < ActiveRecord::Migration[5.2]
  def change
    create_table :hawkerzs do |t|
      t.string :name
      t.text :address
      t.text :food_genre
      t.float :ratings
      t.boolean :vegetarian
      t.boolean :muslim
      t.integer :seating

      t.timestamps
    end
  end
end
