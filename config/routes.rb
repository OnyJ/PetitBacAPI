Rails.application.routes.draw do

  resources :users
  resources :histories

  resources :games do 
    resources :histories, only: [:create, :update]
  end
  resources :friendships
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

