Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # get 'order_items/create'
  # get 'order_items/update'
  # get 'order_items/destroy'
  # get 'carts/show'
  # get 'product_orders/index'
  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /en|vi/ do
    root "pages#home"
    get "/about", to: "pages#about"
    get "/revervation", to: "pages#revervation"
    get "/gallery", to: "pages#gallery"
    get "index", to: "blogs#index"
    resources :blogs, only: [:index, :show]
    resources :products, only: :index
    resource :cart, only: :show
    resources :order_items, only: [:create, :update, :destroy]
  end
  namespace :admin do
    root "categories#index"
    get "dashboard/index"
    resources :categories
    resources :products
    resources :users
  end

  devise_for :users, path: '', path_names: { sign_in: 'login',
    sign_out: 'logout', edit: "profile", confirmation: "confirmation", },
    controllers: { omniauth_callbacks: "omniauth_callbacks"}
end
