Rails.application.routes.draw do

  devise_for :admins, :controllers => {
  	:registrations => 'admins/registrations',
  	:sessions => 'admins/sessions'
  }

  devise_for :customers, :controllers => {
  	:registrations => 'customers/registrations',
  	:sessions => 'customers/sessions'
  }

  root 'fuculties#index'

  #エンドユーザー
  resources :fuculties, only:[:new]



  #管理者
end
