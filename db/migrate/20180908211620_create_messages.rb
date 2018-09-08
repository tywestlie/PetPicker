class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :sender
      t.timestamps
      t.references :connection, index: true, foreign_key: true
    end
  end
end
