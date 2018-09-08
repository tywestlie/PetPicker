class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :status
      t.timestamps

      t.integer :adopter_id
      t.references :pet, index: true, foreign_key: true
    end
  end
end
