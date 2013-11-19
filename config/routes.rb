PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get  '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get  '/users/:username/edit', to: 'users#edit' , as: :edit_profile
  get  '/users/:username', to: 'users#show', as: :show_profile
  post '/users/:id/edit', to: 'users#update', as: :update_profile
  

  get   '/login'  , to: 'sessions#new'
  post  '/login'  , to: 'sessions#create'
  get   '/logout' , to: 'sessions#destroy'

  resources :posts, except: :destroy do
    member do
      post :vote
    end
    
    resources :comments, only: :create do
      member do
        post :vote
      end
    end
  end

  resources :categories

end
