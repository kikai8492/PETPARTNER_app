Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    after_sigin_up_path_for: '/new_option_path',
    after_sign_in_path_for: '/animals'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_scope :user do
    post 'users/admin_sign_in', to: 'users/sessions#admin_sign_in'
  end
  
  resources :animals do
    resources :favorites, only: [:create, :destroy]
    member do
      post 'start_chat'
      delete 'trading_destroy'
    end
  end

  resource :favorites, only: [:show]
  resources :users, only: [:index, :show]
  resources :userinfos, only: [:show]
  root 'animals#index'
  resources :chats, only: [:create, :destroy]
  resources :rooms, only: [:create, :show] 
    
  resources :options, only: [:index, :new, :create, :show]
  resources :checker_show, only: [:show]
  resources :trading_partner_checks, only: [:show]
  resources :trading_partner_check_mores, only: [:show]
  resources :trading_evaluations, only: [:index, :new, :create, :show]
  resources :trading_animals, only: [:index]
end
