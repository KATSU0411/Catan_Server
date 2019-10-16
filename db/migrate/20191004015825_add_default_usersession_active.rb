# frozen_string_literal: true

class AddDefaultUsersessionActive < ActiveRecord::Migration[5.2]
  def change
    change_column :user_sessions, :active, :boolean, null: false, default: false
  end
end
