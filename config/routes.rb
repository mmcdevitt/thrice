Thrice::Application.routes.draw do

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  resources :users, :only => :show

  devise_for :users

  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/dashboard/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :login
    get  '/logout', to: 'devise/sessions#destroy', as: :logout

    get  '/password/new', to: 'devise/passwords#new', as: :password
  end

  resources :listings do
    resources :orders, only: [:new, :create]
  end

  get "pages/about"
  get "pages/contact"
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'home_pages#index'

end
