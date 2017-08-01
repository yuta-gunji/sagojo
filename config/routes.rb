Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  root   'works#index'
  resources :users, only: [:edit, :update]
  resources :works, only: :index
end
