Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #routes for user
  get "/users", to: "users#index"

  #route for backend to receive user JWT
  get "users/keep_logged_in", to: "users#keep_logged_in"

  get "/users/:id", to: "users#show"
  post "/login", to:"users#login"
  post "/users", to: "users#create"

   #routes for quote
   get "/quotes", to: "quotes#index"
   get "/quotes/:id", to: "quotes#show"
   post "quotes", to: "quotes#create"
end
