Rails.application.routes.draw do
  
  resources :storage_products
  resources :storage_materials
  resources :projects
  resources :p_codes
  resources :products
  resources :materials
  resources :tests
  resources :users

  resources :io_tasks
  get 'io_tasks/:id/check', to: 'io_tasks#check', as: 'check_io_task'
  get 'io_tasks/:id/out', to: 'io_tasks#out', as: 'out_io_task'

  resources :product_io_tasks
  get 'product_io_tasks/:id/check', to: 'product_io_tasks#check', as: 'check_product_io_task'
  get 'product_io_tasks/:id/out', to: 'product_io_tasks#out', as: 'out_product_io_task'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  #devise_for :users
  #get 'static_pages/home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
