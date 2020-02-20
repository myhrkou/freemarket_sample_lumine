Rails.application.routes.draw do
  devise_for :users, controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       registrations: "users/registrations",
                     }
  root "items#index"
  
  resources :mypages do
    collection do
      get :mypage
      get :mypagelogout
      get :card
      get :exhibition
      get :trans
      get :complete
      get :negotiate
      get :purchased
      get :voucher
      get :sales
    end
  end
  resources :users do
    collection do
      get :profile
    end
  end
  resources :user_steps, only: [:create]
  resources :user_steps do
    collection do
      get "register1"
      get "register2"
      get "register3"
      get "register4"
      get "done"
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post "pay", to: "cards#pay"
      post "delete", to: "cards#delete"
    end
  end
  resources :items do
    collection do
      post "pay", to: "items#pay"
      get "stop"
      get "exhibition"
      get :search
    end
    member do
      get :pay_comfirm
      post "pay", to: "items#pay"
    end
    resources :comments, only: :create
  end
  resources :categories do
    collection do
      get :category
      get :category_root
      get :category_child
      get :category_grandchild
    end
  end
end
