Rails.application.routes.draw do
  devise_for :users


  resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    member do
      get 'toppage'
      get 'search'
    end
  end

  root 'reviews#toppage'

  resources :lifestyles, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :likeas, only: [:create, :destroy]
    member do
      get 'search'
    end
  end

  resources :users, only: [:edit, :update] do
    member do
      get 'mypage'
    end
  end

  resources :rcomments, only: [:create]

  resources :lcomments, only: [:create]
  

end
