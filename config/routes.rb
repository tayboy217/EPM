Rails.application.routes.draw do


  #デバイスUser側
  devise_for :users,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  #デバイスAdmin側
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

    #Admin側
   namespace :admin do
       resources :contacts, only: [:index, :edit, :update, :destroy]
       resources :users, only: [:index, :show, :edit, :update]
   end

   #Public/User側
   scope module: :public do
     root to: 'homes#top'
     resources :users, only: [:edit, :update] do
       collection do
         get :show
      end
      end
     resources :notes , only: [:new, :create, :edit, :update, :destroy]do
       member do
         get :remember
         get :complete
         post :done
         post :forget
       end
       collection do
         get :remember_index
         get :complete_index
         get :search
       end
     end
     resources :tasks do
       member do
         get :complete
       end
     end
     resources :contacts , only: [:new, :create]
   end
end
