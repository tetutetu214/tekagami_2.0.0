Rails.application.routes.draw do
  devise_for :users
    root 'tops#index'
      resources :preps , only: [:index, :create, :edit, :update, :destroy] do
        resources :tasks , only: [:index, :create, :edit, :update, :destroy]
          resources :actives , only: [:index, :create, :edit, :update, :destroy]
      end
end
