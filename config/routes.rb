require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :books
  resources :subjects
end

Rails.application.routes.draw do
  # all your other routes
  match '*unmatched', to: 'application#route_not_found', via: :all
end

