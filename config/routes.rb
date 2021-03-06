Rails.application.routes.draw do
  resources :services do
    member do
      post 'subscribe_user', to: 'services#register_to_service'
    end
  end
  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks', sessions: 'users/sessions' }
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users do
    member do
      post 'update_role', to: 'users#update_role'
      get 'role', to: 'users#role_select'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
