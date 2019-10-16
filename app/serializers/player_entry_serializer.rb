# frozen_string_literal: true

class PlayerEntrySerializer < ActiveModel::Serializer
  attributes :player_entry_id, :room_id, :user_id

  def player_entry_id
    object.id
  end
end
