Rails.application.routes.draw do
  root 'users#new'
  get 'authentication/new'
  get 'authentication/create'
  get 'authentication/destroy'
  get 'users/index'
  get 'users/create'
  get 'users/new'
  get 'users/destroy'
  get 'users/update'
  get 'users/index'
  get 'users/create'
  get 'users/new'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
