Rails.application.routes.draw do
  resources :tasks
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:edit, :update]
  get 'users/:id/show' => 'users#show', as: :show_user
  get 'users/sign_out' => 'users#sign_out_user', as: :sign_out_user
  
  root 'pages#home'
end
