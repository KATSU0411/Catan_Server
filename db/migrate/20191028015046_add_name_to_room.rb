class AddNameToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :name, :string, null: false
  end
end