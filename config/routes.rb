Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "users#sign_in", as: "sign_in"
  post "/sign_in" => "users#login", as: "login"
  get "/sign_out" => "users#destroy", as: "sign_out"

  root 'welcome#index'

  resources :users, controller: "users", only: [:create, :show] do
  	resource :products,
  	  controller: "products",
  	  only: [:create, :edit, :update]
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end
end
