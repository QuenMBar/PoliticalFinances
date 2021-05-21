Rails.application.routes.draw do
  resources :individual_donations
  resources :committees
  resources :politicans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
