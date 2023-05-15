Rails.application.routes.draw do
  root to: 'home#index'
  get :dashboard, to: 'home#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :referrals do
    member do
      get :resend
    end
  end

  resources :users
end
