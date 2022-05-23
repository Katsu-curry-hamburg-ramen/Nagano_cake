Rails.application.routes.draw do

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