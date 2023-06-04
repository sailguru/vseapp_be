Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, param: :_username

  # Post
  post '/auth/login', to: 'auth/authentication#login'
  post '/auth/verify',to: 'verification/verification#check'

  # Get
  get '/*a', to: 'application#not_found'

end
