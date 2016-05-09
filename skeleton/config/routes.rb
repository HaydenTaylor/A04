Links::Application.routes.draw do

  resources :users
  resources :posts
  resources :links
  resource :session
  resources :comments, only: [:create, :destroy]

end
