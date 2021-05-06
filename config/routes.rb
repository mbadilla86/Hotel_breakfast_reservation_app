Rails.application.routes.draw do
  
  #get 'home/index'
  authenticate :user do
    resources :user_reservations
    resources :user_breakfasts

  end
  
  authenticate :admin do
    resources :hotels
    resources :rooms
    resources :reservations
    resources :breakfasts
    
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admins
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
