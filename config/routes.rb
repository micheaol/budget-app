Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  
  root "splash#index"
  devise_for :users


  resources :entities
  
  resources :categories
end
