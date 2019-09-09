Rails.application.routes.draw do
  # devise_for :users

  resources :events do
    get :time_form
    get :need_items
    get :need_things
    get :need_poeple_or_things
    get :preview_and_publish
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'homes#dashboard'
  root 'signups#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :signups do
      get :time_form
      get :need_items
      get :need_things
      get :need_poeple_or_things
      get :preview_and_publish
    end

    resources :signup_steps

  # Example resource route with options:
    resources :homes do
      # member do
      #   get 'short'
      #   post 'toggle'
      # end

      collection do
        get 'dashboard'
      end
    end

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
