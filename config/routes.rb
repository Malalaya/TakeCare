Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :funerals, only: %i[show new create destroy update index] do
    resources :guests, only: %i[index new show create edit update destroy]
    resources :funeral_flowers, only: %i[index show new create edit update destroy]
    resources :venues, only: %i[index new show create edit update destroy]
    resources :funeral_homes, only: %i[index show new create edit update destroy]
    resources :relatives, only: %i[new show create]
    member do
      get :documents
    end
  end
  resources :users, only: %i[show edit update destroy]
  # delete "users/:id", to: "users#destroy", as: "delete_user"
  get 'my_funeral', to: 'funerals#my_funeral'
  get 'my_profile', to: 'pages#my_profile'
  get '/user_profile/:id', to: 'pages#user_profile', as: 'userprofile'
  get 'about_us', to: 'pages#about_us'
  get 'loss_and_grief', to: 'pages#loss_and_grief'
  get 'forum', to: 'pages#forum'
end
