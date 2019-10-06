# lots of routes
resources :admin, :except => [:index] do
  collection do
    get :client_management
    get :block
    get :manage_client
    post :balance_update
  end
  member do
    # post :update_status
    patch :update_status_reject
    patch :update_status_approve
  end
end
root "admin#index"