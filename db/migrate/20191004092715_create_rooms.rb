# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :status, default: 0, null: false
      t.integer :users, default: 0, null: false
      t.timestamps
    end
  end
end
