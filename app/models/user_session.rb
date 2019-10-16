# frozen_string_literal: true

class UserSession < ApplicationRecord
  AVAILABLE_TIME = 1.hour

  has_secure_token :access_token

  belongs_to :user

  before_create :activate, :set_expiration

  validates :user_id, presence: true
  validates :active, inclusion: { in: [true, false] }

  def activate
    self.active = true
  end

  def activate!
    activate
    save!
  end

  def inactivate
    self.active = false
  end

  def inactivate!
    inactivate
    save!
  end

  def expired?
    Time.current > expires_at
  end

  def set_expiration
    self.expires_at = Time.current + AVAILABLE_TIME
  end

  def set_expiration!
    set_expiration
    save!
  end
  alias update_expiration! set_expiration!
end
