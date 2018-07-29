Depot::Application.routes.draw do
  
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/destroy"
  get "admin/index"
  get "sessions/new"
  get "sessions/create"
  
  resources :users

  resources :orders

  resources :line_items

  resources :carts

  get "store/index"
  resources :products do
    get :who_bought, on: :member
  end


  # root 'store#index', as: 'store'


  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store', via: :all
  end
end
