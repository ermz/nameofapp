Rails.application.routes.draw do
  post 'payments/create'

  devise_for :users
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy, :new]

  get 'simple_pages/index', to: 'simple_pages#index'

  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/landing_page'

  post 'simple_pages/thank_you'

  root 'simple_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
