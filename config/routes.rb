Rails.application.routes.draw do

  #管理者ログイン
  devise_for :admins, :controllers => {
  	:registrations => 'admins/registrations',
  	:sessions => 'admins/sessions'
  }

  #ユーザーログイン
  devise_for :customers, :controllers => {
  	:registrations => 'customers/registrations',
  	:sessions => 'customers/sessions'
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
end
