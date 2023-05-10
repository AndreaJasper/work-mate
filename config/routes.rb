Rails.application.routes.draw do
  root "workorders#index"
  
  get 'signup' => 'users#new'
  resources :users
  
  resources :workorders

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'logou', to: 'sessions#destory'
end
