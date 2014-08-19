Rails.application.routes.draw do
  resources :images

  get '/style_test' => 'application#style_test'
end
