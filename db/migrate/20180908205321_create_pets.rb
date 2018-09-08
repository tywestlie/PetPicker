class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :species
      t.string :description
      t.string :pic
      t.integer :age
      t.integer :weight
      t.timestamps

      t.references :user, index: true, foreign_key: true
    end
  end
end
