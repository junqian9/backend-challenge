Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :members, only: [:new, :create, :index, :show]

  root to: 'members#index'
end
