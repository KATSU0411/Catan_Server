# frozen_string_literal: true

class RoomSerializer < ActiveModel::Serializer
  attributes :room_id, :status, :room_name, :created_at, :updated_at #, :game_id

  def room_id
    object.id
  end

  def room_name
    object.name
  end
end
