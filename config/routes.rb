Rails.application.routes.draw do
  get 'listings/index'

  get 'listings/show'

  get 'listings/new'

  get 'listings/create'

  get 'listings/edit'

  get 'listings/update'

  root :to => "pages#index" 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations =>  'registrations' }
  resources :users, only: [:show]
end
