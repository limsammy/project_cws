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
    collection do
      get :get_zip_data
    end
  end
  resources :products do
  end
  resources :orders do
    member do
      put :status
    end
  end

  resources :orders do
  end
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
