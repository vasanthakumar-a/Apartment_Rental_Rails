Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'devise/sessions' }

  root 'apartments#index'

  resources :apartments do
    get 'page/:page', action: :index, on: :collection
  end
end
