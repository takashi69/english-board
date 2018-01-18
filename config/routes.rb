Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

# schooltopについて実装
  root to: 'schools#index'
  resources :users, only: [:index, :show, :new, :create]
  resources :comments, only: [:create, :destroy]

# schoolのresources:
  resources :schools, only: [:index, :show, :new, :create] do
    member do
      get :courses
      get :toeic
    end
  end
  # cources のresources
  resources :courses, only: [:index, :show, :new, :create]
  

end
