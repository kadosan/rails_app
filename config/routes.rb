Rails.application.routes.draw do
  resources :instagrams do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  devise_for :users
  resources :users, only: [:show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
get 'log/index' => 'log#index'
post 'instagrams' => 'instagrams#create'
root 'instagrams#index'

end
