Rails.application.routes.draw do

  resources :servlets, only: :index
  resources :images, only: [:index, :destroy] do
    resources :servlets, only: :new
  end

  get '/style_test' => 'application#style_test'
  root to: 'servlets#index'
end
