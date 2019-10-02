Rails.application.routes.draw do
  scope :api, format: :json, shallow: true do
    resources :users, only: [:show, :create]
  end
end
