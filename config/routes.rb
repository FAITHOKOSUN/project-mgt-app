Rails.application.routes.draw do
  resources :tasks
  ActiveAdmin.routes(self)
  devise_for :users
  root 'tasks#index'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
end
patch 'tasks/update_name', to: 'tasks#update_name', as: :update_name

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end