# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show]
  end

  resources :posts do
    resources :likes, only: %i[create]
    resources :comments, only: %i[new create]
  end

  root to: 'users#index'
end
