Rails.application.routes.draw do
  resources :users
  resources :devices
  resources :statuses
  resources :monoxides
  resources :humidities
  resources :temperatures
end
