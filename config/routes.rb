BestFacts::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :facts


  authenticated :user do
    root :to => 'facts#index'
  end
  root :to => "facts#index"
  devise_for :users
  resources :users

  ActiveAdmin.routes(self)
end