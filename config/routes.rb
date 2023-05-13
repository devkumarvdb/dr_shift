Rails.application.routes.draw do
  # define the root route
  # root to: "home#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
