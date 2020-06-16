Rails.application.routes.draw do

  resources :games
  resources :friendships
  resources :invites
  resources :categories
  resources :join_category_games

  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end

