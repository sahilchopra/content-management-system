require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/backend_jobs'
  apipie
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :contents, only: [:index]
    end
  end
end
