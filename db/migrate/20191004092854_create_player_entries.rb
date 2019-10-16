# frozen_string_literal: true

class CreatePlayerEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :player_entries do |t|
      t.references :room, null: false
      t.references :user, null: false
      t.timestamps
    end

    add_index :player_entries, %i[room_id user_id], unique: true
  end
end
