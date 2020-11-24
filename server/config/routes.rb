Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index", defaults: { format: :json }
  get "search", to: "search#index", defaults: { format: :json }
  resources :projects, defaults: { format: :json } do
    resources :members
    resources :tickets do
      resources :comments
    end
  end
end
