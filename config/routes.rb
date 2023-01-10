Rails.application.routes.draw do
  get 'chatbot/show'

  post "/chatbot/create", to: "chatbot#create"

  get 'appointments/show'

  get 'appointments/new'

  get 'appointments/destroy'

  get 'users/new'

  post "/appointments/create", to: "appointments#create"
  delete "/appointments/destroy", to: "appointments#destroy"
  resources :appointments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
