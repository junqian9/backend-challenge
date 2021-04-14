Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :members, only: [:new, :create, :index, :show] do
    resources :friendships, only: [:new, :destroy]
    resources :experts, only: [:index]
  end

  root to: 'members#index'
end
