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

 scope module: :public do
   root to: 'homes#top'
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
     end
  end
end
  
end
