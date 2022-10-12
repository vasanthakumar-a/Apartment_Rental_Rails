Rails.application.routes.draw do
  devise_for :owners, path: '/owners', controllers: { sessions: 'owners/sessions' }
  devise_for :users, path: '/users', controllers: { sessions: 'users/sessions' }

  root 'apartments#index'

  get '/apartments/list', to: 'apartments#list', as: 'list'

  resources :apartments do
    get 'page/:page', action: :index, on: :collection
  end
end
