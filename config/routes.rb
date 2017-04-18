Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resource :user, only: [:create]
    resource :session, only: [:create, :destroy, :show]
    resources :flight_cache,  only: [:show, :create]
  end

  root "static_pages#root"

end
