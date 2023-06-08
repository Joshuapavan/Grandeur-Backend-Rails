Rails.application.routes.draw do
  post '/users/sign_up', to: 'users#create'
  post '/users/verify_email', to: 'users#verify_email'
  post '/users/login', to: 'users#login'

  post '/cars/new', to: 'cars#create'
  get '/cars/all', to: 'cars#index'

  get '/cars/search', to: 'cars#search'
end
