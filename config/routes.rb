Rails.application.routes.draw do
  resources :prescriptions
  get 'allusers/index'
  get 'mydoctor/index'
  get 'patients/index'
  get 'users/index'
  get :search, controller: :main
  get :find, controller: :find
  get :look, controller: :look
  devise_for :users
  resources :doctors
  #get 'home/index'
  root 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
