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
  resources :users, only: [:edit, :update] do
    get     'apply_list'  =>  'users#apply_list'
  end
  resources :works, only: :index do
    get 'page/:page', action: :index, on: :collection
  end
  resources  :companies, only: :show do
    resources :works, only: [:new, :create, :show]
    get     'works/:id/form'  =>  'works#form'
    patch   'works/:id/form'  =>  'works#apply'
  end
  resources :categories, only: :index
  resources :tags, only: :index
end

