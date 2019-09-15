Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  delete 'delete', to: 'users#destroy'
  
  get 'form', to: 'products#new'
  
  get 'products/:id', to: 'products#show'
  patch 'products/:id', to: 'products#update'
  get 'products/:id/edit', to: 'products#edit'

  get 'buy', to: 'users#index'
  
  get 'edit', to: 'users#show'
  
 
  

  get 'room', to: 'products#show'
  
  get 'exhibition', to: 'users#_exhibition'
  
  get  'rooms/:id', to: 'rooms#show'

  get 'products/:id/chat', to: 'products#chat'
  
  get 'reviews' , to: 'reviews#_review_form'
  

  
  get 'like' , to: 'users#likes'
  
  # post "favorites/:product_id/create" => "favorite#create"
  
  # post "favorites/:product_id/destroy" => "favorite#destroy"
  
  
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index ,:new, :star]

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :products, only: [:index,:show, :create, :new, :destroy, :edit, :update]
  
  resources :products do 
    member do 
      get :purchase
    end
  end
  
  resources :users do 
    member do 
      get :likes
      get :evaluates
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  
  resources :reviews, only: [:index, :show, :create]
  
end