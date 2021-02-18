Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects#index", defaults: { format: :json }
  get "search", to: "search#index", defaults: { format: :json }
  resources :projects, defaults: { format: :json } do
    resources :members
    resources :tickets do
      resources :comments
    end
    resources :opinions, only: [:index]
  end
  get "project/fetch", to: "projects#fetch", defaults: { format: :json }

  namespace :my do
    get "projects", to: "projects#index", defaults: {format: :json}
    get "tickets/newer", to: "tickets#newer", defaults: {format: :json}
    get "tickets/active", to: "tickets#active", defaults: {format: :json}
    get "tickets/mentioned", to: "tickets#mentioned", defaults: {format: :json}
    get "profile/show", to: "profile#show", defaults: {format: :json}
  end
end
