Rails.application.routes.draw do
 
  devise_for :users, controllers:  { registrations: 'users/registrations'} #,
                                    # omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :tweets
  resources :pictures

  get 'pages/dashboard', as: "dshboard"
  get 'pages/setting_of_twitter', as: "setting_of_twitter"

  get '/auth/:provider/callback', to: 'twitter_accounts#create'
  delete 'pages/setting_of_twitter' => 'twitter_accounts#destroy'
  
  # You can have the root of your site routed with "root"
  root 'pages#dashboard'

  # Example of regular route:
  #get 'users/sign_in' => 'devise/sessions#create'

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
