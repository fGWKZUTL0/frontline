Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: "users/registrations"
  }, path: "account"

  resources :patients do
    resources :medical_records, controller: "patients/medical_records"
  end
  resources :medical_records, only: %i[index]
  resource :hospital
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "users#index"
end
