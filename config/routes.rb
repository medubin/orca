Rails.application.routes.draw do
  resources :flights
  root to: 'flights#index'
end
