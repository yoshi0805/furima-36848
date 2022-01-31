Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :trading_records, only: [:index, :create]
  end
end
