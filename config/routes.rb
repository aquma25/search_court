Rails.application.routes.draw do
  # gem "devise"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "play_grounds#index"
  resources :play_grounds
  resources :users, only:[:show]
end
