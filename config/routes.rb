# Webアプリケーション: HTTPリクエストの４つの’CRUD'メソッドを使用して'リソース'を操作するアプリケーションです！

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  resources :tasks
end

# Rails.application.routes.draw do
#  get 'tasks/:id', to: 'tasks#show' 'id指定'
#  post 'tasks', to: 'tasks#create'
#  put 'tasks/:id', to: 'tasks#update' 'id指定'
#  delete 'tasks/:id', to: 'tasks#destroy' 'id指定'

#  リソースの一覧ページを用意
#  get 'tasks', to: 'tasks#index'

#  新規作成ページの用意
#  get 'tasks/new', to: 'tasks#new'

#  編集ページの用意
#  get 'tasks/:id/edit', to: 'tasks#edit'


#  
#  
# end