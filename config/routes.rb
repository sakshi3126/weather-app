Rails.application.routes.draw do
  get '/signup' => 'user#new'
  post '/users' => 'user#create'
  
  get '/' => 'user#index'
  get '/get_weather' => 'user#get_weather'
  # get 'get_weather/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
