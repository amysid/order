# lots of routes
resources :admin, :except => [:index] do
  collection do
    get :client_management
    get :block
    get :manage_client
    post :balance_update
  end
  member do
    patch :update_status_user
    patch :update_status_reject
    patch :update_status_approve
  end
end
root "admin#index"