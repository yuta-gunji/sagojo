Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  root   'works#index'
  resources :users, only: [:edit, :update]
  resources :works, only: :index
  resources  :companies, only: :show do
    resources :works, only: [:new, :create, :show]
  end
  resources :categories, only: :index
  resources :tags, only: :index
end

