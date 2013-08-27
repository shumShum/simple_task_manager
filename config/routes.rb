SimpleTaskManager::Application.routes.draw do

  scope module: :web do
    root to: 'stories#index'

    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]
    resources :stories
  end

  namespace :api do
    namespace :v1 do
      resources :stories, only: [] do
        scope module: :stories do
          resources :comments, only: [:create, :destroy]
        end
      end
    end
  end

end
