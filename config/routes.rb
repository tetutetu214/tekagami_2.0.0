Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
     resources :preps, only:[:index, :new, :create] do
       resources :tasks, only: [:index, :new, :create] do
         resources :actives, only: [:index, :new, :create] do 
           resources :reviews, only: [:index, :new, :create] 
         end
       end
     end

     resources :preps, only:[:edit, :update, :destroy]
     resources :tasks, only:[:edit, :update, :destroy]
     resources :actives, only:[:edit, :update, :destroy]
     resources :reviews, only: [:edit, :update, :destroy] 
      # resources :preps , only: [:index, :create, :edit, :update, :destroy] do
      #   resources :tasks , only: [:index, :create, :edit, :update, :destroy]
      # end
      #     resources :actives , only: [:index, :create, :edit, :update, :destroy]
      # end
end
