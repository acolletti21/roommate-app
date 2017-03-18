Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#index'
  
  get '/users' => 'users#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/users/:id' => 'users#show'

  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get 'users/:id/edit/neighborhoods' => 'neighborhood_choices#edit'
  post 'users/:id/neighborhoods' => 'neighborhood_choices#update'


  delete 'users/:id' => 'users#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/maps' => 'maps#index'
  get '/maps/2' => 'maps#maps2'
end
