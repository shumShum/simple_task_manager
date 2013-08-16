SimpleTaskManager::Application.routes.draw do

  scope module: :web do
    root to: 'stories#index'

    resource :session, only: [:new, :create, :destroy]

    resources :users, only: [:new, :create]

    resources :stories do
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
