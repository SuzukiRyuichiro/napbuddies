Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get '/events', to: 'events#index', as: 'events'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events', to: 'events#index', as: 'events'
  post '/events', to: 'events#create'
end