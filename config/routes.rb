Rails.application.routes.draw do
  resources :comments
  resources :questions
  resources :questions do 
  	resources :answers, except: [:index]
    resources :comments, except: [:show, :index]
  end
  devise_for :users

  resources :users, only: [:show]

  post "upvote", to: "votes#upvote", as: "upvote"
  post "downvote", to: "votes#downvote", as: "downvote"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "questions#index"
end
