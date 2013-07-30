SimpleTaskManager::Application.routes.draw do
  
  root to: 'stories#index'

  resources :sessions
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users, only: [:create]

  resources :stories do
    get :event
    get :out_by_filters
  end
  match '/out_by_filters', to: 'stories#out_by_filters'
  get '/stories/option/:option' => 'stories#index', constraints: { option: /(to|by)/}

  resources :story_comments, only: [:create, :destroy]

end
