Rails.application.routes.draw do
  root to: 'dashboard#index'

  # dashboard
  get '/dashboard' => 'dashboard#index', as: :dashboard

  # banners
  get  '/banners/new' => 'banners#new',    as: :new_banner
  post '/banners'     => 'banners#create', as: :banners

  # clearance
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: :sign_in
  get "/sign_out" => "clearance/sessions#destroy", as: :sign_out
  get "/sign_up" => "clearance/users#new", as: :sign_up
end
