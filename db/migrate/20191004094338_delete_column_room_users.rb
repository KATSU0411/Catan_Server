# frozen_string_literal: true

class DeleteColumnRoomUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :users
  end
end
