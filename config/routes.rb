Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/search', to: 'articles#search'
  get '/categories/:id/search', to: 'articles#search'
  resources :users, only: [:new, :show, :update, :index, :create, :edit] do
    resources :articles
  end

  resources :articles


  resources :categories, only: [:show] do 
    get '/categories/:category_id/articles/:id', to: 'articles#show'
    
    resources :articles
  end
  resources :votes

end