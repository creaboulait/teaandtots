Rails.application.routes.draw do

  resources :forecasts, only: [:new, :create]
  resources :users 
  resource :session, only: [:new, :create, :destroy]
  resources :kids, only: [:new, :create]
  resources :playdates do
    resources :participations, only: [:new, :create, :destroy]
    resources :reviews
  end
  resources :admins, only: [:index, :destroy]

  root "welcome#index"
  get "welcome/about" => "welcome#about", as: "about" 
  get "welcome/test" => "welcome#test"
 
  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  post "/sign_in" => "sessions#create"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"

  post "playdates/search" => "playdates#search", as: "search"

  patch "users/:id/report" => "users#report", as: "report"
  get "users/:id/unreport" => "users#unreport", as: "unreport"

end
