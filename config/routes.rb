Rails.application.routes.draw do
  get 'reports/index'

  resources :occurrences
  resources :types
  
  get 'home/index'
  post 'home/create_occurrence'

  get 'home/modal'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations'}
  root "home#index"  
end
