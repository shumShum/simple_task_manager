SimpleTaskManager::Application.routes.draw do
  
  root to: 'stories#index'

  resources :sessions
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users, only: [:create]

  resources :stories do
    post :event
    collection { post :search, to: 'stories#index' }
    resources :story_comments, only: [:create, :destroy]
  end
  # match '/out_by_filters', to: 'stories#out_by_filters'
  get '/stories/option/:option' => 'stories#index', constraints: { option: /(to|by)/}

end
