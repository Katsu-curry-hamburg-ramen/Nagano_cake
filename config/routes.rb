Rails.application.routes.draw do
  
  get 'addresses/index'
  get 'addresses/edit'
  
  namespace :public do
    get 'orders/new'
    get 'orders/edit'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
