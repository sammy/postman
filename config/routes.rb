PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get  '/register'    , to: 'users#new'
  post '/register'    , to: 'users#create'
  get  '/:username/profile' , to: 'users#edit' , as: :edit_profile
  

  get   '/login'  , to: 'sessions#new'
  post  '/login'  , to: 'sessions#create'
  get   '/logout' , to: 'sessions#destroy'

  resources :posts, except: :destroy do
    member do
      post :vote
    end
    resources :comments, only: :create
  end

  resources :categories



end
