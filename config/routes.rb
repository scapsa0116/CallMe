Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
       #rout_name    folder/new
  get '/jobs' => 'jobs#new'
  get '/logout' => 'sessions#destroy', via: [:get, :post]
  post '/jobs' => 'jobs#index'
  #post '/signup' => 'user#create'
  resources :users
  resources :categories
  resources :jobs do 
    resources :reviews, only: [:new, :create, :index]
  end
  resources :users do 
    resources :jobs, only: [:new, :create, :index]
  end
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
