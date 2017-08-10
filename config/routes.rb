Rails.application.routes.draw do
  resources :occurrences
  resources :types
  
  get 'home/index'
  post 'home/create_occurrence'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root "home#index"  
end
