Rails.application.routes.draw do
  scope :api, format: :json, shallow: true do
    resources :user_sessions, only: [:create, :destroy]
    resources :users, only: [:show, :create]
    resources :rooms, only: [:index, :show, :create]
    resources :player_entries, only: [:destroy, :create]
  end
end
