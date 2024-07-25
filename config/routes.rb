Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  # get 'persons/profile'
  # get 'persons/profile', as: :posts
  resources :posts
end
