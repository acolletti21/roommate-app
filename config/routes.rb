Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/searches' => 'searches#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/users/:id' => 'users#show'

  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  get 'users/:id/neighborhoods' => 'users#neighborhoods'

  delete 'users/:id' => 'users#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
