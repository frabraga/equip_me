Rails.application.routes.draw do
  resources :bookings do
    resources :reviews, only: [ :new, :create ]
  end


  resources :equipments
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
