Rails.application.routes.draw do
  use_doorkeeper
  root to: 'main#dashboard'

  devise_for :users

  resources :users, only: :index

  namespace :api do
    namespace :v1 do
      resources :publishers, only: [] do
        get :shops, on: :member
      end
      resources :shops, only: [] do
        patch :sell, on: :member
      end
    end
  end
end
