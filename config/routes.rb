Rails.application.routes.draw do
  get 'booking/create'
  devise_for :users
  root to: 'events#index'
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events/:id', to: 'events#show', as: 'event'
  get '/events', to: 'events#index', as: 'events'
  post '/events', to: 'events#create'
end
