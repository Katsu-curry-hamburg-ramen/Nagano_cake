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
    resources :items, only: [:new,:index,:show,:edit,:create,:update]
  end
  namespace :public do
    resources :items, only: [:index,:show] do
  collection do
        post 'search'
       end
    end
  end
end