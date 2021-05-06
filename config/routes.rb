Rails.application.routes.draw do
  resources :user_breakfasts
  resources :hotels
  resources :rooms
  resources :breakfasts
  resources :reservations
  get 'home/index'
  
  devise_for :admins
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
