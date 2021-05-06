Rails.application.routes.draw do

  authenticate :user do
    resources :user_breakfasts
  end

  authenticate :admin do
    resources :hotels
    resources :rooms
    resources :reservations
    resources :breakfasts
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
      root to: "user_breakfasts#index", as: :authenticated_user_root
    end

    unauthenticated :user do
      root to: "users/sessions#new", as: :unautenticated_user_root
    end
  end

  devise_scope :admin do
    authenticated :admin do
      root to: "hotels#index", as: :authenticated_admin_root
    end

    unauthenticated :admin do
      root to: "admins/sessions#new", as: :unautenticated_admin_root
    end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
