Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :questions do 
  	resources :answers
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "questions#index"
end
