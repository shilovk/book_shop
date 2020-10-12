Rails.application.routes.draw do
  use_doorkeeper
  root to: 'main#dashboard'

  devise_for :users

  resources :users, only: :index

  namespace :api do
    namespace :v1 do
    end
  end
end
