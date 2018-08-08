Rails.application.routes.draw do

  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :kids, only: [:new, :create]
  resources :playdates do
  	resources :participations
  end

  root 'welcome#index'
 
  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  post "/sign_in" => "sessions#create"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"

  post 'playdates/search' => 'playdates#search', as: "search"

end
