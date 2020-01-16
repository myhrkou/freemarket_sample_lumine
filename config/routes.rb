Rails.application.routes.draw do
  devise_for :users
  root 'tests#index'
  resources :users
  resources :user_steps, only: [:create]
  resources :user_steps do
    collection do
      get "step1"
      get "step2"
      get "step3"
      get "step4"
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
end
