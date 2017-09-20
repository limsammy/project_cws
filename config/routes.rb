Rails.application.routes.draw do

  devise_for :users

  root to: 'home#dashboard'

  resources :users do
    collection do
      get "send_invitation"
      put "create_invitation"
    end
  end

  resources :products  do
    collection do
      get "per_amount"
      get "per_price"
    end
  end


  resources :addresses do
    collection do
      get :find_states
      get :find_cities
    end
  end

  resources :companies do

  end

  resources :clients do
  end
  resources :products do
  end
  resources :orders

  resources :orders do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
