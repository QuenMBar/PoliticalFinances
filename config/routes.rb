Rails
    .application
    .routes
    .draw do
        resources :users, only: %i[index create]
        resources :sessions, only: [:create]
        post '/signup', to: 'users#create'
        # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
