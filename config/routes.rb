Rails.application.routes.draw do

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    unlocks:       'users/unlocks',
    omniauth:      'users/omniauth'
  }
  root 'users#index'
  resources :users do
    resources :training_reports
  end
  resources :trainings
  resources :training_menus
  resources :relationships, only: [:create, :destroy]
  resources :likes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
