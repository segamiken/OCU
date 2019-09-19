Rails.application.routes.draw do

  #管理者ログイン
  devise_for :admins, :controllers => {
  	:registrations => 'admins/registrations',
  	:sessions => 'admins/sessions'
  }

  #ユーザーログイン
  devise_for :customers, :controllers => {
  	:registrations => 'customers/registrations',
  	:sessions => 'customers/sessions',
    :omniauth_callbacks => 'customers/omniauth_callbacks'
  }

  #トップページ
  root 'fuculties#index'

  #エンドユーザー
  resources :fuculties, only:[:new] do
  	resource :departments, only:[:show, :new]
  end

  resources :departments, only:[:index] do
  	resource :lessons, only:[:new, :create] do
      collection do
      get :index
      get :select
      get :ranking
      end
    end
  end

  resources :lessons, only:[:show] do
    get :images, on: :member
    resources :comments do
      resource :favorites, only: [:create, :destroy]
      collection do
        get :complete
      end
    end
  end

  resources :customers, only:[:show, :edit, :update] do
    get :comments, on: :member
  end



  #管理者
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update] do
    get :comments, on: :member
    post '/delete' => 'customers#delete'
    end
  end


  namespace :admin do
    resources :fuculties, only:[:index, :new, :create, :edit, :update, :destroy]  do
      resource :departments, only:[:show]
    end
  end

  namespace :admin do
    resources :departments, only:[:index] do
    resources :lessons, only:[:index]
    end
  end

  namespace :admin do
    resources :lessons, only:[:show, :destroy] do
    resources :comments
  end
  end


end
