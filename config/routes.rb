Rails.application.routes.draw do
  root to: "play_grounds#index"
  resources :play_grounds
  post "play_grounds/init_map", to: "play_grounds#init_map"
end
