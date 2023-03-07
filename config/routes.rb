Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :funerals, only: %i[show new create index] do
    resources :guests, only: %i[index new create]
    resources :flowers, only: %i[index new create]
    resources :venues, only: %i[index new create]
    resources :funeral_homes, only: %i[index new create]
  end
  resources :users, only: [:show]
  get "my_funeral", to: "funerals#my_funeral"
end
