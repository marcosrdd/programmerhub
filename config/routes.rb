Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :comments, only: [:create, :destroy, :edit, :update]
  resources :posts, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :likes, only: [:create, :destroy]
  resources :follows, only:[:create, :destroy]

  get '/profile/:id', to: "users#show", as: "user"
  get '/profile/:id/following', to: "users#followings", as: "following"
  get '/profile/:id/followers', to: "users#followers", as: "followers"
  post '/users/search', to: "users#search", as: :search
  get '/users/search', to: "users#search"
end
