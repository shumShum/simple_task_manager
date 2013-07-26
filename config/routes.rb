SimpleTaskManager::Application.routes.draw do
  
  root to: 'stories#index'

  resources :sessions
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users, only: [:new, :create]
  resources :stories

end
