Rails.application.routes.draw do
  devise_for :users


  resources :reviews do
    resources :likes, only: [:create, :destroy]
    resources :rcomments, only: [:create]
  end

  get "toppage" => "reviews#toppage", as: :toppage_review
  resources :rtags do
    get 'reviews', to: 'reviews#search'
  end

  resources :lifestyles do
    resources :likeas, only: [:create, :destroy]
    resources :lcomments, only: [:create]
  end

  resources :ltags do
    get 'lifestyles', to: 'lifestyles#search'
  end

  get "lifestyles/search/:id" => "lifestyles#search", as: :search_lifestyle

  resources :users, only: [:edit, :update] 

  get "users/mypage/:id" => "users#mypage", as: :mypage_user

  root 'reviews#toppage'

  

end
