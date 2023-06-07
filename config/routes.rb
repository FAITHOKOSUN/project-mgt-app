Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'about' => "pages#about"
  # Defines the root path route ("/")
  # root "articles#index"
end
