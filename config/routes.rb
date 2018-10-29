Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "users#sign_in", as: "sign_in"
  post "/sign_in" => "users#login", as: "login"
  get "/sign_out" => "users#sign_out", as: "sign_out"

  get "/auth/:provider/callback" => "users#create_from_omniauth"

  get "products/ajax_search" => 'products#ajax_search', as: 'ajax_search'

  post 'products/checkout'

  get "/search" => "products#search"
  root 'welcome#index'

  resources :users, controller: "users", only: [:create, :show] do
  	# resource :products,
  	#   controller: "products",
  	#   only: [:create, :show, :edit, :update]
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  resources :products, controller: "products" 
end
