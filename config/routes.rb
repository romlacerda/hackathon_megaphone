Rails.application.routes.draw do
  resources :types
  get 'home/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root "home#index"  
end
