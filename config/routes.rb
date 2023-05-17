Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :managers do
    get "members", on: :member
  end

  resources :employees

  get "users/sign_in/:mobile", to: "users#sign_in"
end
