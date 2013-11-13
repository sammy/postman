PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  post 'register', to: 'users#create'

  resources :posts, except: :destroy do
    resources :comments, only: :create
  end

  resources :categories



end
