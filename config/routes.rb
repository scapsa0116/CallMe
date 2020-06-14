Rails.application.routes.draw do
  root 'sessions#home'

  get '/users/most-active' => 'users#most_active'


  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
       #rout_name    folder/new
  #get '/jobs' => 'jobs#index'
  get '/logout' => 'sessions#destroy', via: [:get, :post]
  #post '/jobs' => 'jobs#index'
  #post '/signup' => 'user#create'
  #post 'reviews' => 'reviews#show'
  
  get "/auth/google_oauth2/callback" => 'sessions#google'
  #get "/auth/:provider/callback"
  
  
  resources :jobs do
    resources :reviews
  end

  resources :reviews

  # resources :users
  # resources :categories
  
  
  # resources :jobs do 
  #   resources :reviews, only: [:new, :create, :index]
  # end
  
  resources :users do 
    resources :jobs, shallow: true
  end
  
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
