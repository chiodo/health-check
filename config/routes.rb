Rails.application.routes.draw do

  resources :clusters
  root to: 'visitors#index'
end
