Rails.application.routes.draw do

  post "welcome/login_attempt" => "welcome#login_attempt"
  post "users/create" => "users#create"
  resources :mentors

  get "welcome/forget_password" => "welcome#forget_password"
  get "users/new" => "users#new"
  get "welcome/index" => "welcome#index"
  get "welcome/logout" => "welcome#logout"
  get "mentors_new" => "mentors#new"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "parent" => "parent#index"
  get "parent/edit" => "parent#edit"
  put "parent" => "parent#update"
  get "parent/new" => "parent#new"
  post "parent/create" => "parent#create"
  
  get "mentor/quit_group/:id" => "mentors#quit_group", as: :mentor_quit_group
  
  #get "group" => "group#index"
  #get "group/edit" => "group#edit"
  #put "group" => "group#update"
  #delete "group" => "group#destroy"
  resources :child
  resources :group
  get 'group/:id/change' => 'group#change', as: :change_group
  
  # get "delmem/:id" => "group#del_member", as: 'deletemember'
  #resources :group
  # You can have the root of your site routed with "root"
  root 'welcome#index'
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
