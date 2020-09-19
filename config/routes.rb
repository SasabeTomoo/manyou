Rails.application.routes.draw do
  get 'labellings/index'
  get 'sessions/new'
  root to: "tasks#index"
  resources :labellings, only: [:index, :create, :destroy]
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users,    only: [:new, :create, :show, :edit, :update]
  namespace :admin do
    resources :users
  end
end
