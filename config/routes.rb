Rails.application.routes.draw do
  root to: "play_grounds#index"
  resources :play_grounds
end
