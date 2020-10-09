Rails.application.routes.draw do
  root 'users#new'
  resources :users
  
  get 'admin', :to => 'access#dashboard'
  get 'access/dashboard'
  get 'access/login'
  post 'access/login', to: 'access#create', as: "access"
  get 'access/logout'
  
 

  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
