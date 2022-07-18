Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users/user_id/posts",  to: "posts#index", as: :posts
  get "/users/user_id/posts/:id", to: "posts#show", as: :post
 
  get "/users", to: "users#index", as: :users
  get "users/h/hello/:id", to: "users#show" ,as: :user
end
