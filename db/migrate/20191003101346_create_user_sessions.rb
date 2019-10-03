class CreateUserSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sessions do |t|
      t.string :access_token, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :active, null: false, defualt: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
