Rails.application.routes.draw do
  root to: 'toppages#index'
  
  
  get 'joins/create'
  get 'joins/destroy'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :joins
    end
  end
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :events
  resources :joins, only: [:create, :destroy]
end