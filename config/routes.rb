Rails.application.routes.draw do
  get 'my_pokemons/search'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :my_pokemons, only: %i[index new create show search edit update]
  # resources :trades, only: %i[index new create show]
end
