Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  #get 'tasks/new', to: 'tasks#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get    'guestadmin/login', to: 'sessions#create2'
  get    'guest/login', to: 'sessions#create3'
  
  resources :users do
    resources :tasks
  end
  
end
