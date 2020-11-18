Rails.application.routes.draw do
  get 'artworks/index'
  devise_for :users
  root to: 'pages#home'
  resources :artworks, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artworks do
    resources :bookings, only: [:create]
  end
end
