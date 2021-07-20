Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :uodate]
  resources :books, only: [:new, :create, :index, :show, :edit, :update]


end
