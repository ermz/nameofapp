Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/index', to: 'simple_pages#index', as: 'index'

  get 'simple_pages/about', to: 'simple_pages#about', as: 'about'

  get 'simple_pages/contact', to: 'simple_pages#contact', as: 'contact'

  root 'simple_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
