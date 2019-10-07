class RoomSerializer < ActiveModel::Serializer
  attributes :room_id, :status, :owner_name, :created_at, :updated_at, :game_id

  def room_id
    object.id
  end
end
