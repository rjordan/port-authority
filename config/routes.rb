Rails.application.routes.draw do

  resources :servlets
  resources :images, only: [:index, :destroy]

  get '/style_test' => 'application#style_test'
  root to: 'servlets#index'
end
