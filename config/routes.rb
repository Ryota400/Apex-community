Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create index show]
  resources :party_boards do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resources :videos do
    collection do
     get :favorites
    end
  end
  resources :favorites, only: %i[create destroy]
  resources :clips do
    collection do
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[show edit update]

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :party_boards, only: %i[index edit update show destroy]
    resources :videos, only: %i[index edit update show destroy]
    resources :clips, only: %i[index edit update show destroy]
    resources :users, only: %i[index edit update show destroy]
  end

end
