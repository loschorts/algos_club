Rails.application.routes.draw do
  resources :questions
  resources :questions do 
  	resources :answers, except: [:index]
  end
  devise_for :users

  resources :users, only: [:show]

  post "answers/:id/upvote", to: "answers#upvote", as: "answer_upvote"
  post "answers/:id/downvote", to: "answers#downvote", as: "answer_downvote"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "questions#index"
end
