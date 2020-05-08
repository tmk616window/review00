Rails.application.routes.draw do
  get 'channels/show'
  get 'rooms/show'
  get 'index/show'
  get 'index/new'
  get 'index/edit'
  get '/explain/:id' , to:'posts#explain'
  post '/tasks/:id', to:'tasks#like'
  get '/room/:id/' , to:'users#room', as: 'room'
  get 'maps/index'
  resources :maps, only: [:index]

  
  devise_for :users
  root to: 'tasks#index'
  resources :'chats'
  resources :'tasks'
  resources :'likes' , only: [ :create , :destroy ] 
  resources :'follows'
  resources :'users'
  resources :'posts'
  resources :'channels'
  resources :'messages'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
