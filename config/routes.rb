  devise_for :users, controllers: {
            omniauth_callbacks: "users/omniauth_callbacks",
            registrations: "users/registrations",
          }
  root "tests#index"
  resources :users
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
      post "show", to: "cards#show"
      post "pay", to: "cards#pay"
      post "delete", to: "card#delete"
    end
  end

  resources :tests
    resources :tests do
    collection do 
      get :mypage
    end
  end
end