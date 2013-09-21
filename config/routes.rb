Fatidd::Application.routes.draw do
  devise_for :users

  resources :tasks

  resources :users, only: :show

  post '/emails', to: 'home#emails'

  root to: 'tasks#index'
end
