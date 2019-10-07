Rails.application.routes.draw do
# match '*path' => redirect('/'), via: :get


  get "logout" => "sessions#logout"
  get "my_profile" => "sessions#my_profile"
  get "sessions/signin"
  get "sessions/signup"
  post "sessions/register"

  resources :orders do
   collection do
    get :approve_order
    get :client_user
   end
 end
  resources :clients
  resources :products
  get 'client/my_profile', as: "profile"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :constraints => lambda { |request| request.env['warden'].user&.role.present? } do
    scope :constraints => lambda { |request| request.env['warden'].user&.role == "Admin" } do
      draw :admin
    end

    scope :constraints => lambda { |request| request.env['warden'].user&.role == "Agent" } do
      draw :client_admin
    end

    scope :constraints => lambda { |request| request.env['warden'].user&.role == "Client" } do
      draw :client
    end

    resources :airtimes
    resources :utility_payments
    resources :transactions do
      collection do
        get :generate_pdf
        get :Modal_data
      end
    end

    #get "my_profile" => "application#my_profile"
    post "update_profile" => "sessions#update_profile"
    get "unique_email" => "sessions#unique_email"
    post "upload_kyc_document", to: "sessions#upload_kyc_document"
    get "unique_user_name" => "sessions#unique_user_name"
    get 'transactions_search' => "transactions#index"
  end


  scope :constraints => lambda { |request| request.env['warden'].user.nil? } do
    get "secondFA" =>"sessions#secondFA"
    post "login" => "sessions#login"
    get "resend" => "sessions#resend"
    post "confirm_secondFa" => "sessions#confirm_secondFa"
    get "req_password" => "sessions#req_password"
    # root "sessions#new"
    root "client#index"

  end

    resources :errors do
      collection do
        get :error_message
        get :abc
      end
    end

end
