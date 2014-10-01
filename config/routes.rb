Rails.application.routes.draw do
  root to: 'donors#index'

  resources :donors
end
