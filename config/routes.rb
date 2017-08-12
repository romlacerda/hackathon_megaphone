Rails.application.routes.draw do
  get 'reports/index'

  resources :occurrences
  resources :types
  
  get 'home/index'
  get 'home/modal'

  post 'home/create_occurrence'
  post 'home/getById'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations'}
  root "home#index"  
end
