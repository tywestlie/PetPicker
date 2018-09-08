class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :species_to_adopt
      t.integer :search_radius
      t.decimal :lat
      t.decimal :lng
      t.integer :role, default: 0
      t.string :fb_token
      t.timestamps
    end
  end
end
