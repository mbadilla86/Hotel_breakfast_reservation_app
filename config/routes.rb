Rails.application.routes.draw do
  resources :breakfasts
  resources :reservations
  resources :rooms
  resources :hotels
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
