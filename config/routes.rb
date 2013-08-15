SimpleTaskManager::Application.routes.draw do
  
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
  get '/stories/option/:option' => 'stories#index', constraints: { option: /(to|by)/}, as: :stories_option

end
