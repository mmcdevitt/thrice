Thrice::Application.routes.draw do

  resources :users, :only => :show

  devise_for :users, :controllers => { :registrations => "registrations" },
             :skip => [:sessions, :passwords]

  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/dashboard/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :new_user_session
    post '/login', to: 'devise/sessions#create', as: :user_session
    get  '/logout', to: 'devise/sessions#destroy', as: :logout

    get  '/password/new', to: 'devise/passwords#new', as: :new_user_password
    post '/password/new', to: 'devise/passwords#create', as: :user_password
  end

  resources :listings do
    resources :orders, only: [:new, :create]
  end

  get "pages/about"
  get "pages/contact"
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'listings#index'

end
