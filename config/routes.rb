Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events/:id', to: 'events#show', as: 'event'
  get '/events', to: 'events#index', as: 'events'
  post '/events', to: 'events#create'
  get '/events/:id/bookings/new', to: 'bookings#new', as: 'new_event_bookings'
  post '/events/:id/bookings', to: 'bookings#create', as: 'event_bookings'
  get '/dashboard', to: 'dashboards#show', as: 'dashboard'
  get '/users/:id', to: 'users#show', as: 'profile'
end
