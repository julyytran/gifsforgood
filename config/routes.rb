Rails.application.routes.draw do

  get '/', to: 'sessions#index'
  # get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  resources :users, only: [:new, :create]
  resources :tags, only: [:index]
  resources :gifs, only: [:index, :show]

  get '/:name', :to => "tags#show", as: :tag

end
