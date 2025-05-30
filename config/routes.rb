Rails.application.routes.draw do
  devise_for :usuarios
  root "relatorio#visao_geral"

  resources :historico_pagamentos
  resources :despesas
  resources :orcamentos
  resources :forma_pagamentos
  resources :receitas
  resources :usuarios
  resources :unidade_familiares

  get 'contas/new', to: 'despesas#new_conta', as: 'nova_conta'
  post 'conta/save', to: 'despesas#save_conta', as: 'save_conta'
  get 'contas', to: 'despesas#listar_contas', as: 'listar_contas'
  post 'pagamento_despesa', to: 'despesas#pagamento_despesa', as: 'pagamento_despesa'

  get 'area_administrativa', to: 'administrativo#area_administrativa'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get "up" => "rails/health#show", as: :rails_health_check
end
