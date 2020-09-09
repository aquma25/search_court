Rails.application.routes.draw do
  # gem "devise"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'users/mail_sent', to: 'users/registrations#mail_sent'
  end
  resources :users, only:[:show]

  root to: "play_grounds#index"
  resources :play_grounds
  post "play_grounds/playing_users", to: "play_grounds#playing_users"
  post "play_grounds/go_home_users", to: "play_grounds#go_home_users"
end
