Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  #  do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  resources :users, only: [:show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :languages
  resources :curriculums do
    resources :posts, shallow: true
    resources :reviews, shallow: true
  end

  get '/languages/:id/course_sorted', to: 'languages#course_sorted'
  get '/languages/:id/curriculum_sorted', to: 'languages#curriculum_sorted'

  get '/searches/course_sorted', to: 'searches#course_sorted'
  get '/searches/curriculum_sorted', to: 'searches#curriculum_sorted'

  get '/curriculums/:id/reorder_posts', to: 'curriculums#edit_posts_order'
  put '/curriculums/:id/reorder_posts', to: 'curriculums#update_posts_order'

  resources :courses do 
    resources :reviews, shallow: true
  end

  resources :searches, only: :index
  # resources :curriculums
  # You can have the root of your site routed with "root"
  root 'languages#index'

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
