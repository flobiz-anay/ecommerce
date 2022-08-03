Rails.application.routes.draw do
  resources :users
  resources :users, only:[:new, :create]

  post 'sign_up', to: 'users#create'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
