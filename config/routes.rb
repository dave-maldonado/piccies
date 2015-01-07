require 'api_constraints'

Rails.application.routes.draw do
  # routes for Rails::API back-end
  #
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :albums, except: [:new, :edit] do
        resources :pictures, except: [:new, :edit]
      end
    end
  end

  # routes for Angular front-end
  #
  root 'gallery#index'
end
