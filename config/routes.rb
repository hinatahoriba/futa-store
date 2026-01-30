Rails.application.routes.draw do
  # トップページ
  root "home#index"

  # 学生番号検索
  post "search", to: "home#search"

  # ユーザー配下のリソース
  resources :users, only: [] do
    scope module: :users do
      resources :items, only: [:index]
      resources :purchases, only: [:create]
      resources :charges, only: [:new, :create]
    end
  end

  # 管理者機能
  namespace :admin do
    root "dashboard#index"
    resources :items, only: [:index, :new, :create, :edit, :update] do
      resources :prices, only: [:new, :create]
      resources :supplements, only: [:new, :create]
    end
    resources :users, only: [:index, :new, :create, :edit, :update]
    resources :purchase_histories, only: [:index]
  end


  # PWA関連
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
