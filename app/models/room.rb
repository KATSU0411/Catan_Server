# frozen_string_literal: true

class Room < ApplicationRecord
  PLAYER_ENTRY_COUNT = 4

  enum status: { waiting: 0, playing: 1, finished: 2 }

  validates :name, presence: true
  has_many :player_entries, dependent: :delete_all

  def ready?
    player_entries.size == PLAYER_ENTRY_COUNT
  end

  def enter_as_player!(user)
    entryies = PlayerEntry.find_by(room: self)
    raise 'FullHouseError' if entryies.size >= PLAYER_ENTRY_COUNT

    entry = PlayerEntry.new
    entry.user = user
    entry.room = self
    entry.save!
  end
end
