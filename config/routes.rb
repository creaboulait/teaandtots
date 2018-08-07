Rails.application.routes.draw do
  resources :users
  
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"

  root 'welcome#index'
end
