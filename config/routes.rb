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
  	resource :classes, only:[:show, :new]
  end

  #管理者
end
