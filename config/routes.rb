SimpleTaskManager::Application.routes.draw do

  scope module: :web do
    root to: 'stories#index'

    resources :sessions
    match '/signout', to: 'sessions#destroy', via: :delete

    resources :users, only: [:create]

    resources :stories do
      post :event
      collection { post :search, to: 'stories#index' }
      scope module: :stories do
        resources :comments, only: [:create, :destroy]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      #some api resources
    end
  end

end
