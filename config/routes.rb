Rails.application.routes.draw do
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
  get    '/users/:id/snippets', to: 'users#snippets', as: :user_snippets

  root 'pages#index'
  resources :users
  resources :snippets do
    resources :comments, except: [:index, :new, :show]
  end
end
