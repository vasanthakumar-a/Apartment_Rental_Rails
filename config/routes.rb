Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'devise/sessions' }

  root 'apartments#index'

  get '/apartments/list', to: 'apartments#list'

  resources :apartments do
    get 'page/:page', action: :index, on: :collection
  end
end
