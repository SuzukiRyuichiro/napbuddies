Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events/:id', to: 'events#show', as: 'event'
  get '/events', to: 'events#index', as: 'events'
  post '/events', to: 'events#create'
end
