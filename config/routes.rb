Rails.application.routes.draw do
  devise_for :owners, path: '/owners', controllers: { sessions: 'owners/sessions' }
  devise_for :users, path: '/users', controllers: { sessions: 'users/sessions' }

  root 'apartments#index'

  get '/apartments/list', to: 'apartments#list', as: 'list'
  get '/payment', to: 'payments#index', as: 'payment'
  get '/payment/history', to: 'payments#history', as: 'payment_history'
  post '/apartments/payment', to: 'payments#new_payment', as: 'new_payment'
  get '/apartments/my_apartment', to: 'apartments#my_apartment', as: 'my_apartment'
  get '/apartments/:id/owner_details', to: 'apartments#owner_details', as: 'owner_details'
  post '/apartments/:id/owner_details', to: 'payments#reduce_credit', as: 'reduce_credit'

  resources :apartments do
    get 'page/:page', action: :index, on: :collection
  end
end
