Rails.application.routes.draw do
  devise_for :users
    root 'tops#index'
     resources :preps do
       resources :tasks, only: [:index, :create] do
         resources :actives, only: [:index, :create] 
       end
     end

     resources :tasks, only:[:show, :edit, :update, :destroy]
     resources :actives, only:[:show, :edit, :update, :destroy]

      # resources :preps , only: [:index, :create, :edit, :update, :destroy] do
      #   resources :tasks , only: [:index, :create, :edit, :update, :destroy]
      # end
      #     resources :actives , only: [:index, :create, :edit, :update, :destroy]
      # end
end
