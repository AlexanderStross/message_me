Rails.application.routes.draw do
  resources :messages
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
end
