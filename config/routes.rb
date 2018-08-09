Rails.application.routes.draw do

  resources :users 
  resource :session, only: [:new, :create, :destroy]
  resources :kids, only: [:new, :create]
  resources :playdates do
    resources :participations, only: [:new, :create, :destroy]
    resources :reviews
  end

  root "welcome#index"
  get "welcome/about" => "welcome#about", as: "about" 
 
  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  post "/sign_in" => "sessions#create"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"

  post "playdates/search" => "playdates#search", as: "search"

  # get "playdates/:id/reviews/new" => "reviews#new", as: "new_review"
  # post "playdates/:id/reviews/new" => "reviews#create"
    # resources :reviews, only: [:index, :new, :create, :destroy]
end
