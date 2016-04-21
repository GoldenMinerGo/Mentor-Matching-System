Rails.application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  post "welcome/login_attempt" => "welcome#login_attempt"
  resources :mentors

  get "welcome/forget_password" => "welcome#forget_password"
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get "welcome/index" => "welcome#index"
  get "welcome/parent_signin" => "welcome#parent_signin"
  get "welcome/logout" => "welcome#logout"
  get "mentors_new" => "mentors#new"
  get "groupinvs/send_inv/:id" =>"groupinvs#send_inv", as: :groupinvs_send_inv
  get "groupinvs/accept_inv_mentor/:id" => "groupinvs#accept_inv_mentor", as: :groupinvs_accept_inv_mentor
  get "groupinvs/accept_inv_group/:id" => "groupinvs#accept_inv_group", as: :groupinvs_accept_inv_group
  get "groupinvs/cancel_inv/:id" => "groupinvs#cancel_inv", as: :groupinvs_cancel_inv
  get "groupinvs/decline_inv/:id" => "groupinvs#decline_inv", as: :groupinvs_decline_inv
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "parent" => "parent#index"
  get "parent/edit" => "parent#edit"
  put "parent" => "parent#update"
  get "parent/new" => "parent#new"
  post "parent/create" => "parent#create"
  
  get "mentor/quit_group/:id" => "mentors#quit_group", as: :mentor_quit_group
  get "invitation/group_send_inv_to_child/:id" =>"invitation#group_send_inv_to_child", as: :invitation_group_send_inv_to_child
  get "invitation/child_accept_group/:id" =>"invitation#child_accept_group", as: :invitation_child_accept_group
  #get "group" => "group#index"
  #get "group/edit" => "group#edit"
  #put "group" => "group#update"
  #delete "group" => "group#destroy"
  resources :user
  resources :rglusers
  get 'fbuser/fb_login' => 'fbuser#fb_login', as: :fb_auth
  get 'casusers/cas_login' => 'casusers#cas_login', as: :cas_login
  get 'casusers/cas_logout' => 'casusers#cas_logout', as: :cas_logout
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
