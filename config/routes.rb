Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'devise/sessions' }

  root 'apartments#index'

  resources :apartments
end
