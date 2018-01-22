Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

# schooltopについて実装
  root to: 'schools#index'
  resources :users, only: [:index, :show, :new, :create]

# schoolのresources:
# schoolもeditするので、きちんと操作しよう。

  resources :schools, only: [:index, :show, :new, :create, :edit, :update] do
# resource 単数形? IDを二つ要求するroutingによる。
    resource :courses, only: [:new, :create]
    member do
      get :courses
    end
  end
  # cources のresources
  resources :courses, only: [:index, :show, :edit, :update, :destroy] do
    resource :comment, only: [:create]
  end
  
  resources :comments, only: [:show, :edit, :update, :destroy]
end
