Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # resources :auths, only: [:create]
  resources :kinds

  api_version(:module => "V1", :header => {:name => "X-Version", :value => "1.0"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show, :update, :create, :destroy]
      resource :phones, only: [:show, :update, :create, :destroy], path: 'relationships/phones'

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end

  api_version(:module => "V2", :header => {:name => "X-Version", :value => "2.0"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show, :update, :create, :destroy]
      resource :phones, only: [:show, :update, :create, :destroy], path: 'relationships/phones'

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end
  # get '/contacts', to: "contacts#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
