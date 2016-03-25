Rails.application.routes.draw do
  devise_for :users
  get'/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post 'products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  ##########################################################
  get '/suppliers' => 'suppliers#index'
  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'
  get '/suppliers/:id' => 'suppliers#show'
  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch 'suppliers/:id' => 'suppliers#update'
  delete '/products/:id' => 'suppliers#destroy'
  ##########################################################
  get '/images/:id/new' => 'images#new'
  post '/images/:id' => 'images#create'
  ##########################################################
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
  ##########################################################
  get 'carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'  
  delete '/carted_products/:id' => 'carted_products#destroy'
end
