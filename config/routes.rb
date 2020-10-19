Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #routes for user
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"

   #routes for quote
   get "/quotes", to: "quotes#index"
   get "/quotes/:id", to: "quotes#show"
end
