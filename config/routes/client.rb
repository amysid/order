# resources :users do
#   collection do
#     get "secondFa"
#     get "request_password"
#     get "my_profile"
#     post :update_profile
#   end
# end
# root "users#index"
# 
resources :client do
  collection do
    get :employee
    get "new/employee",to: "client#new_employee"
    post :create_employee
  end
end
root "client#index"