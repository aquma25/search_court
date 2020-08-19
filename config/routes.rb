Rails.application.routes.draw do
  # gem "devise"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "play_grounds#index"
  resources :play_grounds
  post "play_grounds/playing_users", to: "play_grounds#playing_users"
  post "play_grounds/go_home_users", to: "play_grounds#go_home_users"
  resources :users, only:[:show]
end
