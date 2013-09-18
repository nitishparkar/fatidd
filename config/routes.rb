Fatidd::Application.routes.draw do
  devise_for :users
  post '/emails', to: 'home#emails'
end
