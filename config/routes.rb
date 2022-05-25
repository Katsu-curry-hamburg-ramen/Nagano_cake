Rails.application.routes.draw do

  namespace :public do
    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
  end
  delete :cart_images, to: 'public/cart_items#destroy_all', as: 'cart_items'
  namespace :admin do
    resources :genres, only: [:new, :index, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :admin do
    resources :order_items
  end


  namespace :admin do
    resources :items, only: [:new,:index,:show,:edit,:create,:update]
  end
  namespace :public do
    resources :items, only: [:index,:show] do
  collection do
        get 'search'
       end
    end
  end



  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: 'about'

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]


  namespace :admin do
    resources :orders, only: [:show, :update]
  end


  namespace :public do
    resources :orders, only: [:new, :index, :show, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :public do
    resources :customers
  end

  # 退会確認画面
  get '/customers/:id/unsubscribe' => 'public/customers#unsubscribe', as: 'customer_unsubscribe'
  # 論理削除用のルーティング
  patch '/customers/:id/withdrawal' => 'public/customers#withdrawal', as: 'customers_withdrawal'

  namespace :admin do
    resources :customers
  end



end