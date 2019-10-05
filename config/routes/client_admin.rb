# resources :client do
#   collection do
#     get :employee
#     get "new/employee",to: "client#new_employee"
#     post :create_employee
#   end
# end
# root "client#index"
resources :client_admins, :except => [:index] do
  collection do
    get :employee
    get "new/employee",to: "client#new_employee"
    post :create_employee
    get :department
    get :payroll
    get :abc
    get :manage_department

  end
end
root "client_admins#index"
