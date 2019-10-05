# lots of routes
resources :admin, :except => [:index] do
  collection do
    get :client_management
    get :block
    get :manage_client
    post :balance_update
    post :update_status
  end
end
root "admin#index"