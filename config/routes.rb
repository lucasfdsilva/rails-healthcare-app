Rails.application.routes.draw do
  resources :prescriptions
  get 'results', to: "results#results"
  get 'allusers/index'
  get 'mydoctor/index'
  get 'patients/index'
  get 'users/index'
  get :search, controller: :main
  get :find, controller: :find
  get :look, controller: :look
  devise_for :users
  resources :doctors
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
