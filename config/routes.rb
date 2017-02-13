Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: %i( destroy ) do
    scope module: 'groups' do
      resources :messages, only: %i( index )
    end
  end
  resources :users, only: %i( edit update)
end
