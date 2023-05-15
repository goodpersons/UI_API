Rails.application.routes.draw do
  get 'signup/create'
  get 'signin/create'
  get 'signin/destory'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'signin', to: 'signin#create'  #登入
  post 'signup', to: 'signup#create'  #注册
  delete 'signin', to: 'signin#destory' #退出（注销）
end
