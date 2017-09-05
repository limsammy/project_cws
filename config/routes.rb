Rails.application.routes.draw do
  devise_for :users
  root to: 'home#dashboard'
  resources :users do
    collection do
      get "send_invitation"
      put "create_invitation"
    end
  end
  resources :addresses do
  end

  resources :companies do
  end
  resources :clients do
  end
  resources :products do
  end
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
