Rails.application.routes.draw do
  root 'conversations#index'

  resources :conversations do
    resources :messages
  end

  resources :users
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
end
