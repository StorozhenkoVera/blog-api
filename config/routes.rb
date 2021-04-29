Rails.application.routes.draw do
  root 'conversations#index'

  resources :conversations do
    resources :messages
  end

  resources :users
end
