Rails.application.routes.draw do
  resources :recebimentos
  resources :transportadoras
  resources :encomendas
  resources :destinatarios
  resources :remetentes
  resources :enderecos
  resources :funcionarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :encomendas do
    collection do
      get 'search'
    end
  end

  resources :funcionarios do
    get 'search', on: :collection
  end
  resources :funcionarios do
    collection do
      get :search
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
