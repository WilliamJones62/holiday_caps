Rails.application.routes.draw do
  resources :turkey_caps do
    collection { post :import }
  end
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'turkey_caps#index'
end
