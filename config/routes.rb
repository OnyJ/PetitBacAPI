Rails.application.routes.draw do

  resources :games
  resources :friendships
  resources :invites
  resources :categories

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
