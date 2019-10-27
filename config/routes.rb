Rails.application.routes.draw do
  
  root to: 'messages#index'

  get 'ABOUT',to:'abouts#index'

  get 'PORTFOLIO',to:'portfolios#index'
  
  resources :messages
  resources :abouts, only: [:index]
  resources :portfolios, only: [:index]
  
end