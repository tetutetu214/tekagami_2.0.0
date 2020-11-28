Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
     resources :preps, only:[:index, :new, :create] do
       resources :tasks, only: [:index, :new, :create,:edit,:update] do
         resources :actives, only: [:index, :new, :create,:edit,:update] do 
           resources :reviews, only: [:index, :new, :create,:edit,:update] 
         end
       end
     end

     resources :preps, only:[:edit, :update, :destroy]
     resources :tasks, only:[:destroy]
     resources :actives, only:[:destroy]
     resources :reviews, only: [:destroy] 
      # resources :preps , only: [:index, :create, :edit, :update, :destroy] do
      #   resources :tasks , only: [:index, :create, :edit, :update, :destroy]
      # end
      #     resources :actives , only: [:index, :create, :edit, :update, :destroy]
      # end
end
