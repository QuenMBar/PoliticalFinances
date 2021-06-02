Rails
    .application
    .routes
    .draw do
        resources :users, only: %i[index create]
        resources :sessions, only: [:create]
        post '/signup', to: 'users#create'
        post '/login', to: 'sessions#create'
        resources :counties, only: %i[index show]
        resources :zip_codes, only: %i[show]
        post '/link', to: 'users#link'
        delete '/link', to: 'users#unlink'
        get '/geojson', to: 'counties#geojson'
        put '/users/bio', to: 'users#update'
        put '/users/priv', to: 'users#togglePrivate'
        get '/users/relations', to: 'users#relations'
        # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
