Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show]
  root to: "play_grounds#index"
  resources :play_grounds
end
