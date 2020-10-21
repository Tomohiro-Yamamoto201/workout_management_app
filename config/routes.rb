Rails.application.routes.draw do

  get 'training_menus/new'
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    unlocks:       'users/unlocks',
    omniauth:      'users/omniauth'
  }
  root 'users#index'
  resources :users
  resources :trainings
  resources :training_menus
  resources :training_reports
  resources :likes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
