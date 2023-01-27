Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/exhibit', to: 'exhibit#exhibit', as: 'exhibit'
  post '/signup', to: 'signup#signup', as: 'signup'
  resources :items, only: :update
end
