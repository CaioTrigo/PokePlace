Rails.application.routes.draw do
  get 'my_pokemons/search'
  post 'my_pokemons/trade'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :my_pokemons, only: %i[index new create show search]
end
