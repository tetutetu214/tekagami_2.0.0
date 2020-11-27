Rails.application.routes.draw do
  get 'reviews/index'
  devise_for :users
     resources :preps do
       resources :tasks, only: [:index, :create] do
         resources :actives, only: [:index, :create] do 
           resources :reviews, only: [:index, :create] 
         end
       end
     end

     resources :tasks, only:[:show, :edit, :update, :destroy]
     resources :actives, only:[:show, :edit, :update, :destroy]
     resources :reviews, only: [:show, :edit, :update, :destroy] 
      # resources :preps , only: [:index, :create, :edit, :update, :destroy] do
      #   resources :tasks , only: [:index, :create, :edit, :update, :destroy]
      # end
      #     resources :actives , only: [:index, :create, :edit, :update, :destroy]
      # end
end
