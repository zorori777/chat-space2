Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:new, :create, :edit, :update] do
    scope module: 'groups' do
      resources :messages, only: [:index]
    end
  end
  resources :users, only: [:edit, :update]
end
