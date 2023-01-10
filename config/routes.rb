Rails.application.routes.draw do
  get 'appointments/show'

  get 'appointments/new'

  get 'appointments/destroy'

  get 'users/new'
  resources :appointments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
