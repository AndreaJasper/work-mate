Rails.application.routes.draw do
  root "workorders#index"
  
  get 'signup' => 'users#new'
  resources :users
  
  resources :workorders

  get 'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
end
