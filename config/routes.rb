Rails.application.routes.draw do
  root "administrativo#index"

  resources :historico_pagamentos
  resources :despesas
  resources :orcamentos
  resources :forma_pagamentos
  resources :receitas
  resources :usuarios
  resources :unidade_familiares

  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
end
