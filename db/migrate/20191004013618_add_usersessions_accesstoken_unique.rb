class AddUsersessionsAccesstokenUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :user_sessions, :access_token, unique: true
  end
end
