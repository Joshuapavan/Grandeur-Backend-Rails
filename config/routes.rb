Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/users/sign_up', to: 'users#create'
  get '/users/verify_email', to: 'users#verify_email'
  post '/users/login', to: 'users#login'

  post '/cars/new', to: 'cars#create'
  get '/cars/all', to: 'cars#index'

  get '/cars/search', to: 'cars#search'
  delete '/cars/delete', to: 'cars#destroy'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
