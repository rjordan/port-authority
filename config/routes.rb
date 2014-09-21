Rails.application.routes.draw do

  resources :servlets, only: [:index,:create]
  resources :images, only: [:index, :destroy] do
    resources :servlets, only: :new
  end

  get '/style_test' => 'application#style_test'
  root to: 'servlets#index'
end
