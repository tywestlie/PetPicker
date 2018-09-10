class AddKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :key, :string
  end
end
