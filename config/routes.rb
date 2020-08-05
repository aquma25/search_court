Rails.application.routes.draw do
  # gem "devise"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "play_grounds#index"
  resources :play_grounds
  resources :users, only:[:show]
end
