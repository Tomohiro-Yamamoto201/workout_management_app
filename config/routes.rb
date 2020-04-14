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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
