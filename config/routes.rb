Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  mount ActionCable.server => '/cable'
  resources :messages
  resources :posts do
    resources :comments, only: [:create, :destroy]
    member do
      patch "upvote", to: "posts#upvote"
      patch "downvote", to: "posts#downvote"
    end
  end
end
