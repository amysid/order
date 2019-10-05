class UsersController < ApplicationController
	# layout 'web'
	# before_action :authenticate_employee! ,only: [:index,:my_profile,:update_profile]
	#before_action :check_user
	# extend NewRedirectConcern

	def new
		#binding.pry
		 @user = User.find_by(id: session[:user_id]) if session[:user_id].present?
		# if @user && @user.role.eql?(Employee)
		# 	redirect_to redirect_by_role(@user)
		# end
	end

	def create

	end

	def index

	end

	def secondFa
		# redirect_to root_path unless session[:user].present?
	end

	def request_password
		if params[:forgot_password].present? && params[:forgot_password][:email].present?
  			 @user = User.find_by(email: params[:forgot_password][:email].downcase)
   			if @user && @user.blocked!=1 && (@user.role.eql?("Client Admin")||@user.role.eql?("Super Admin"))
    			@user.create_reset_digest
    			@user.send_password_reset_email
			    flash[:notice] = "Email send with reset password "
			    redirect_to root_path
		  	else
    			flash[:error] = "Email Address Not Found"
    			redirect_to root_path
  			end
		end
	end

	def my_profile
		kyc_document = @current_user.build_kyc_document unless @current_user.kyc_document.present?
	end

	def update_profile
		if @current_user.update(client_params)
			flash[:success] = "Profile updated successfully"
			redirect_to request.referer
		else
			flash[:error] = "Profile not updated"
			redirect_to request.referer
		end
	end

	private

	def client_params
		params.require(:user).permit(:user_name,:email,kyc_document_attributes: [:id,:front_pic,:back_pic])
	end

end
