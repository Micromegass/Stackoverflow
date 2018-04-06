Rails.application.routes.draw do
  devise_for :users
  resources :answers, only: [:create, :new]

  resources :questions do
        resource :vote, only: [:create, :destroy]
          resources :comments, only: [:create]

  end
  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
