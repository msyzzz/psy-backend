Rails.application.routes.draw do
  get 'tokens/create'
  post 'tasks/result', to: "tasks#result"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :tokens, only: [:create]
  resources :questionnaires
  resources :results
  resources :doctors, only: [:create]
  resources :tasks
end
