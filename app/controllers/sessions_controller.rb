class SessionsController < ApplicationController
 # extend NewRedirectConcern
# before_action :verify_user, only: [:new]
  # before_action :verify_otp_session, only: [:resend, :secondFA, :confirm_secondFa]

 def new
   #binding.pry
   
  end

  def register
    unless params[:user][:password].eql?(params[:user][:confirm_password])
        flash[:error] = "Password and Confirm Password is not same."
      return render  :signup
    end
    @user = User.new(client_params)
    if @user.save
      flash[:success] = "Signup successfully."
      redirect_to sessions_signin_path
    else
      flash[:error] = "Something went wrong"
      render  :signup
    end
  end

  def login
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user.present?&&@user.blocked!=1
        login_method
      
    else
        flash[:error] = "Invalid email or password!!"
        redirect_to user_to_root
    end
  end
  def login_method
    unless  @user.authenticate(params[:user][:password])
          flash[:error] = "Invalid email or Password!!"
          #return redirect_to user_to_root if @user.role.eql?("Employee")
          redirect_to user_to_root
        else
          session[:user_id] = @user.id
          # User.send_otp_token(@user)
          #return redirect_to secondFa_users_path if @user.role.eql?("Employee")
          redirect_to root_path
        end
  end


def req_password
  if params[:forgot_password].present? && params[:forgot_password][:email].present?
   @user = User.find_by(email: params[:forgot_password][:email].downcase)
   if @user
    @user.create_reset_digest
    @user.send_password_reset_email
    flash[:notice] = "Email sent with reset password"
    redirect_to user_to_root
  else
    flash[:error] = "Email Address Not Found"
    redirect_to user_to_root
  end
end

end

def resend
 accept = "gmail.com"
 email = params["user"]["email"].split('@')[1]
    if email == accept
      render json: true
    else
      render json: false
    end
end

def secondFA

  # @user = User.find_by(id: session[:user])
  # @token = @user.authentication_token
  a = @user.email.split(/(?<=^.)(.*)(?=(.*?)\@)/)
  a[1] = ("*" * a[1].length)
  @email = a.join('')
  # redirect_to user_to_root unless  session[:user].present?
#view  second FA page
end

def confirm_secondFa
  @user=User.find_by(otp_params)#User.find_by(authentication_token: params[:token])
  binding.pry

  unless @user
    flash[:error] =  "Invalid Token"
    redirect_to request.referer
 else
  @user.update(authentication_token: nil)
  session.delete(:user)
  # session[:user] = nil
  session[:user_id] = @user.id
  flash[:success] =  "Login Successfully"
  redirect_to  #redirect_by_role(@user)
end

end

def my_profile
  @user = current_user
end

def update_profile
  #binding.pry
  @user = current_user
  if @user.update(profile_update)
    render json: true
  else
    render json: false
  end
  #redirect_to
end

def signin
  
end

def logout
  #@user = User.find_by(id: session[:user_id])
  session[:user_id] = nil
  flash[:success] = "Log out successfull!"
  redirect_to user_to_root
  #return redirect_to user_to_root if current_user.role.eql?("Employee")
end



#uniqueness of email
  def unique_email
    #binding.pry
    @user= User.where(id: params[:id]) || User.where(email: params[:user][:email])
    @users = User.all - @user
       if  @users.pluck(:email).include?(params[:user][:email].downcase)
         render json: false
       else
         render json: true
       end
   end

#uniqueness of user_name
  def unique_user_name
    #binding.pry
    @user= User.where(id: params[:id]) || User.where(user_name: params[:user][:user_name])
    @users = User.all - @user
     if @users.pluck(:user_name).include?(params[:user][:user_name])
       render json: false
     else
       render json: true
     end
  end

  private
  def otp_params
    params.require(:verify_otp).permit.merge("authentication_token" => params[:verify_otp][:otp].join('').downcase,id: session[:user])
  end

  def profile_update
    params.require(:user).permit(:client_name,:address,:gender,:country,:mobile,:dob)
  end

  def client_params
    params.require(:user).permit(:name,:email,:role,:password)
  end

  def verify_otp_session
    unless session[:user].present?
      flash[:error] = "Please login first"
      redirect_to user_to_root
    else
      @user= User.find_by(id: session[:user])
    end
  end
end
