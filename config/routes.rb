Rails.application.routes.draw do
  scope :api, format: :json, shallow: true do
    resources :user_sessions, only: [:create, :destroy]
    resources :users, only: [:show, :create]
  end
end
