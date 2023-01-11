Rails.application.routes.draw do
  get 'tokens/create'

  # consult
  get 'consults/show'
  get 'appointments/show_user'
  get 'appointments/show_doctor'
  get "/emotion_analysis", to: "appointments#emotion_analysis_get"
  post "/emotion_analysis", to: "appointments#emotion_analysis_post"
  post 'appointments/create'
  delete 'appointments/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :tokens, only: [:create]
  resources :questionnaires
  resources :results
end
