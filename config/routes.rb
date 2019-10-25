# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, format: :json, shallow: true do
    resource :user_sessions, only: %i[create destroy]
    resources :users, only: %i[show create]
    resources :rooms, only: %i[index show create]
    resources :player_entries, only: %i[destroy create]
  end
end
