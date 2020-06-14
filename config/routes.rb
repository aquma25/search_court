Rails.application.routes.draw do
  root to: "play_grounds#index"
  resources :play_grounds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
