Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #TOPページ
  root to: 'newses#index'
  resources :newses
  
end
