Rails.application.routes.draw do
  root 'users#new'
  resources :users, only:[:index, :new, :create]
  
  
  get 'admin', :to => 'access#dashboard'
  get '/users/:id', :to => 'access#show', as: 'user'
  get 'access/dashboard'
  get 'access/login'
  post 'access/login', to: 'access#create', as: "access"
  get 'access/logout'
  
  
  resources :relationships, only: [:create, :destroy]
  
  resources :feelings, only:[:new, :create]
  

  
 

  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
