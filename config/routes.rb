Rails.application.routes.draw do
  get 'artworks/index'
  get 'profile', to: 'pages#profile_page'
  devise_for :users
  root to: 'pages#home'
  resources :artworks, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show]
end
