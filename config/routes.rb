Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :posts  #only: [:show, :index, :new , :create ,:edit, :update]
  get'signup' ,to: 'users#new'
  #resources :users, except: [:new]
  resources :users , only: [:show ,:index]
  #resources :comments, only: [:new,:create]
end