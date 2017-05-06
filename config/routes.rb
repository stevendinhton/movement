Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resource :pages do
  end

  resource :users do
    collection do
      get 'login'
      post 'validate_login'
      get 'logout'
    end
  end
end
