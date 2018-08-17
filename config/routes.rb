Rails.application.routes.draw do
  root to: 'equipments#index'

  resources :equipments do
    collection do
      get 'list'
      get 'search'
    end
    resources :bookings, only: [:new, :create, :show]
  end

  resources :bookings, only: [:index, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
