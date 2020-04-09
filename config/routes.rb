Rails.application.routes.draw do

  root "dogs#index"
  get "/dogs/sorted", to: "dogs#sorted", as: "sorted"

  resources :dogs
  resources :employees
end
