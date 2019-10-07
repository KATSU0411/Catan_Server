class PlayerEntry < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :room_id, presence: true

  validates :user_id, uniqueness: { scope: :room_id, allow_nil: false }

  def user_name
    user&.name
  end
end
