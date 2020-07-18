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
  resources :user
  resources :trainings
  resources :training_menus
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
