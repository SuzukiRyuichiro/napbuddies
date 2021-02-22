Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
