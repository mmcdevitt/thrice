Thrice::Application.routes.draw do

  get 'seller', to: "listings#seller"
  get 'sales', to: "orders#sales"
  get 'purchases', to: "orders#purchases"
  get 'sell', to: 'listings#new'
  get 'sell/:listing_id/photos', to: 'listing_images#index', as: :images
  get 'listings/:listing_id/photos', to: 'listing_images#index', as: :listings_images
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]



  devise_for :users

  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/dashboard/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :login
    get  '/logout', to: 'devise/sessions#destroy', as: :logout

    get  '/password/new', to: 'devise/passwords#new', as: :password
  end

  resources :users, :only => :show

  resources :listings do
    resources :listing_images
  end

  get '/checkout', to: 'orders#new'
  resource :orders, only: [:create]

  get "pages/about"
  get "pages/contact"

  get '/:title', to: 'categories#show', as: :category
  root 'home_pages#index'

end
