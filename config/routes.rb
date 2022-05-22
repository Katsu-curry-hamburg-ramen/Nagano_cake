Rails.application.routes.draw do
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