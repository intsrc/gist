Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/destroy'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'pages#index'
  resources :users
  resources :snippets do
    resources :comments, except: [:index, :new, :show]
  end
end
