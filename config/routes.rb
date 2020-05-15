Rails.application.routes.draw do
  root to: 'homepages#index'
  
  resources :works
  resources :homepages, only: [:index]
end
