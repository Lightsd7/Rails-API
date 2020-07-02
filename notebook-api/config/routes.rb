Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show, :update, :create, :destroy]
    resource :phones, only: [:show, :update, :create, :destroy], path: 'relationships/phones'

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  end
  # get '/contacts', to: "contacts#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
