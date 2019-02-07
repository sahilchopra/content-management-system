Rails.application.routes.draw do
  apipie
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :contents, only: [:index]
    end
  end
end
