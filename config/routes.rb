Rails.application.routes.draw do
  root 'users#new'

  post '/login',                    to: 'sessions#create'
  post '/logout',                   to: 'sessions#destroy'
  get '/logged_in',                 to: 'sessions#is_logged_in?'
  get '/signup',                    to: 'users#new'

  post '/create_article',           to: 'articles#create'
  get '/articles',                  to: 'articles#index'
  get '/article/:id',               to: 'articles#show'

  post '/create_comment',           to: 'comments#create'
  get '/comment/:article_id',       to: 'comments#show'
  get '/delete/:article_id',        to: 'comments#delete'

  resources :users, only: [:create, :show, :index]

end
