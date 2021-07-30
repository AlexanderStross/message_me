Rails.application.routes.draw do
  root 'chatroom#index'
  get 'terms_and_conditions', to: 'pages#terms_and_conditions'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  mount ActionCable.server, at: '/cable'
end
