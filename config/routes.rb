Rails.application.routes.draw do
  root to: 'dashboard#index'

  # dashboard
  get '/dashboard' => 'dashboard#index', as: :dashboard

  # banners
  resources :banners, only: [:new, :create, :update]

  # clearance
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/signin" => "clearance/sessions#new", as: :sign_in
  delete "/signout" => "clearance/sessions#destroy", as: :sign_out
  get "/signup" => "clearance/users#new", as: :sign_up
end
