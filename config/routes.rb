Rails.application.routes.draw do
  
  devise_for :users
  resources :answers, only: [:create, :new] do
  resource :voteanswer, only: [:create, :destroy]

  end

  resources :comments, only: [:create, :new]


  resources :questions do
        resource :point, only: [:create, :destroy]


  end

  post 'questions/:id/voteup' => 'questions#voteup', as: 'vote_question'
   post 'questions/:id/votedown' => 'questions#votedown', as: 'delete_vote'

   post 'answers/:id/voteup' => 'answers#voteup', as: 'vote_answer'
  post 'answers/:id/votedown' => 'answers#votedown', as: 'delete_vote_answer'


  resources :points
  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


