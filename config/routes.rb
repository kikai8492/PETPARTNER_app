Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    after_sigin_up_path_for: '/new_option_path',
    after_sign_in_path_for: '/animals'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
  resources :rooms, only: [:create, :show] do
    member do
      get :suggest_meeting_place
    end
  end

  resources :options, only: [:index, :new, :create, :show]
  resources :checker_show, only: [:show]
end
