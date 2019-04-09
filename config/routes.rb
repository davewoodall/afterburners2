# frozen_string_literal: true

Rails.application.routes.draw do
  concern :resources do
    resources :albums
    resources :genres, only: [:index]
    resources :artists, only: %i[index show]
    get 'ranks/:rank', to: 'ranks#index'
  end

  namespace :api, path: nil do
    namespace :v1, defaults: { format: :json } do
      concerns :resources
    end
  end
end
