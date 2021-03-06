ProjectMilestoneTask::Application.routes.draw do
  #post "project/create"
 #root :to => "projects#index"
  #get "projects/index"
resources :projects do
  member do
    get "finish_project"
  end
  resources :milestones do
    member do
      get "finish_milestone"
    end
  end
end

resources :milestones do
  resources :tasks do
    member do
      get "finish_task"
    end
  end
end

root :to => "sessions#new"
get "log_in" => "sessions#new", :as =>"log_in"
get "sign_up" =>"users#sign_up", :as=>"sign_up"
get "users_tasks" =>"tasks#users_tasks", :as=>"users_tasks" 
get "log_out" => "sessions#destroy", :as => "log_out"
resources :users
resources :sessions

  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  #match ':controller(/:action(/:id))(.:format)'
end
