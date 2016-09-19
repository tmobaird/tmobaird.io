Rails.application.routes.draw do
  resources :posts, except: [:index, :create], constraints: { subdomain: 'blog' }
  get '/' => 'posts#index', :as => 'posts', constraints: { subdomain: 'blog' }
  post '/' => 'posts#create', constraints: { subdomain: 'blog' }
  resources :projects
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/contact", to: "pages#contact"
end
