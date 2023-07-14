Rails.application.routes.draw do
  post '/auth/login', to: 'api/v1/authentication#login'

  namespace :api do
    namespace :v1 do
      resources :libraries_users
      resources :users do
        resources :books, only: [:index, :show, :update, :destroy], controller: :users_books
      end
      resources :libraries do
        resources :books
        resources :users, only: [:index, :show, :update, :destroy], controller: :libraries_users
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
