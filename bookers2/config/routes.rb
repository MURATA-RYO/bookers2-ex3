Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users do
  resource :relationships, only: [:create, :destroy] 
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :following, :followers
    end  
  end
  
  
end
