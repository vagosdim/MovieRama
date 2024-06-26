Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  resources :movies, except: [:show] do
    post 'react', on: :member, controller: 'reactions'
    patch 'reverse_reaction', on: :member, controller: 'reactions'
    delete 'undo_reaction', on: :member, controller: 'reactions'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "movies#index"

  # Error routes
  get '*path', to: 'errors#not_found'

end
