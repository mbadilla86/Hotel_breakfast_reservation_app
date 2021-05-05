Rails.application.routes.draw do
  get 'home/index'
  devise_for :admins
  devise_for :users
  resources :breakfasts
  resources :reservations
  resources :rooms
  resources :hotels
  devise_for :users, controllers: {
        sessions: 'users/sessions'
        registrations: 'users/registrations'

      }
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
