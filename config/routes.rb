Rails.application.routes.draw do
  
  root 'users#new'

  get 'membership/index'

  get 'membership/new'

  get 'membership/create' 

  get 'membership/show'

  get 'membership/edit'

  get 'membership/update'

  delete 'membership/delete' 

  get 'index' => 'groups#index', as: 'index'

  get 'groups/new'

  post 'add_group' => 'groups#create', as: 'add_group'

  get 'groups/show' => 'groups#show', as: 'group'

  get 'groups/join' => 'memberships#create', as: 'add_first_member'

  post 'groups/join' => 'memberships#create', as: 'add_membership'

  delete 'groups/leave' => 'memberships#delete', as: 'delete_membership'

  delete 'groups/delete' => 'groups#delete', as: 'delete_group'

  get 'sessions/index'

  get 'login' => 'sessions#new', as: 'login_page'

  post 'login' => 'sessions#create', as: 'login'

  get 'sessions/show'

  get 'sessions/edit'

  get 'sessions/update'

  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'users/index' => 'users#index' 

  get 'register' => 'users#new', as: 'register_page'

  post 'register' => 'users#create', as: 'register'

  get 'showuser' => 'users#show', as: 'user'

  get 'users/edit' => 'users#edit', as: 'edit_user'

  patch 'users/update' => 'users#update', as: 'update_user'

  get 'users/delete'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
