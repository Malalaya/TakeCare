Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :funerals, only: %i[show new create index] do
    resources :guests, only: %i[index new show create edit update destroy]
    resources :flowers, only: %i[index show new create edit update destroy]
    resources :venues, only: %i[index new show create edit update destroy]
    resources :funeral_homes, only: %i[index show new create edit update destroy]
    resources :relatives, only: %i[new show create]
  end
  resources :users, only: %i[show]
  get 'my_funeral', to: 'funerals#my_funeral'
  get 'my_profile', to: 'pages#my_profile'
  get '/user_profile/:id', to: 'pages#user_profile', as: 'userprofile'
end
