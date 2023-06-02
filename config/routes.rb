require './app/controllers/auth/authentication_controller'
require './app/controllers/application_controller' 
require './app/controllers/verification/verification_code_controller'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, param: :_username

  # Post
  post '/auth/login', to: 'authentication#login'

  # Get
  get '/auth/sms/code',to: 'verification_code#sms_code'
  get '/*a', to: 'application#not_found'

end
