Rails.application.routes.draw do

  
  root 'main#home'
  get 'main/home'
  get '/home' => 'main#home'


  #Rutas para recursos
  resources :articles
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
