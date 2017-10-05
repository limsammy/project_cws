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
      get :get_zip_data
    end
  end

  resources :customers do
     collection do

    end

  end

  resources :contacts do
    member do
      get :select_product
      get :find_product
      get :adding_order
    end
    collection do
      get :product_save
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
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
