Rails.application.routes.draw do
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
# Sidekiq stuff

  resources :episodes
  resources :series
  resources :users

  root 'login#index'

  get '/admin/first' => 'first#index'
  get 'about/index'
  get 'about' => 'about#index'
  get '/logout' => 'login#logout' # 退出登陆: 清 session 
  post '/login/test' => 'login#test'
  get '/admin' => 'login#admin'
  get '/admin/serie' => 'login#serie'
  get '/admin/episode/:page' => 'login#episode'

  #
  # Api
  #
  get '/api/newest/:page' => 'api#newest'
  get '/api/episode/:id' => 'api#episode'
  get '/api/series' => 'api#series'
  get '/test' => 'test#index'
  
  #
  # 测试用的, 生产环境要关掉
  #
  # get '/justlogmein' => 'login#justlogmein'
    
    
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
