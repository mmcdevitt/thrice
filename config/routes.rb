Thrice::Application.routes.draw do

  get 'seller', to: "listings#seller"
  get 'sales', to: "orders#sales"
  get 'purchases', to: "orders#purchases"
  get 'sell', to: 'listings#new'
  get 'sell/:listing_id/photos', to: 'listing_images#index', as: :images
  get 'listings/:listing_id/photos', to: 'listing_images#index', as: :listings_images
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy, :show]

  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/profile/edit', to: 'devise/registrations#edit', as: :profile_edit
    get  '/login', to: 'devise/sessions#new', as: :login
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
    get  '/password/new', to: 'devise/passwords#new', as: :password
  end

  scope :u do
    get '/:username', to: 'profiles#show', as: :user_profile
  end

  resources :listings do
    resources :listing_images

    member do
      get '/publish', to: 'listings#publish'
    end
  end

  get '/checkout', to: 'orders#new'
  resources :orders, only: [:create, :show] do
    member do
      get '/confirmation', to: 'orders#confirmation'
    end
  end

  get "pages/about"
  get "pages/contact"

  get '/:title', to: 'categories#show', as: :category
  root 'home_pages#index'

end
