# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :projects
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  get '/contact', to: 'pages#contact'
  post '/posts/markdown', to: 'posts#markdown'
end
