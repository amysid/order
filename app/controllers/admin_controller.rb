class AdminController < ApplicationController
	#protect_from_forgery except: :client_management
	#skip_before_action :verify_authenticity_token, :only => [:client_management]
	 # layout 'admin'
	# layout false
#  layout 'admin', :except => :index
	#layout 'admin', only: [:index]
	#layout false
	# before_action :authenticate_user!
	before_action :find_user, only: [:edit,:update,:destroy,:block]
	def index
		@User = User.all
	#show dashboard
	end

	def client_management
		#binding.pry
		@balance = current_user.wallet.current_balance
		if params[:search]
		  @users = User.where("email ILIKE ? OR client_name ILIKE ? ", "%"+params[:search]+"%","%"+params[:search]+"%")
		#User.where("email = ? OR user_name = ?", "user7@example.com", "user0")
			@users.order("created_at ASC")
		else
		@users= @current_user.clients.order("created_at ASC")
	  end
		# @pagy, @users = pagy(@users , items: 10)
		@pagy, @users = pagy(@users)

	end

	def new
   @user = User.new
	 @comission = @user.build_comission
	end

 def create
	 #binding.pry
 	unless params[:user][:password].eql?(params[:user][:confirm_password])
	    	flash[:error] = "Password and Confirm Password is not same."
			return render  :new
		end
		params[:user][:role]= "Client Admin"
		@user = @current_user.admins.new(client_params)
		if @user.save
			flash[:success] = "User created successfully."
			redirect_to client_management_admin_index_path
    	else
    		flash[:error] = "Error are there!!!!!!!!!"
    		render  :new
    	end
 end

def update_status_approve
	order =	Order.find(params[:id])
		order.update(status: "Approve")
		flash[:success] = "Order status changed succesfully"
	redirect_to orders_path
end

def update_status_reject
 order =	Order.find(params[:id])
 order.update(status: "Reject")
 flash[:success] = "Order status changed succesfully"
 redirect_to orders_path

end

def edit
	# @user= User.find_by(id: params[:id])
#edit form of user
end
def update

	 if @user.present?  && @user.update(edit_params)
	flash[:success] = "User updated successfully."
	redirect_to client_management_admin_index_path
else
	flash[:error] = "Error are there!!!!!!!!!"
    redirect_to request.referer
end
end
def destroy

	@user.destroy if @user.present?
	redirect_to client_management_admin_index_path

end
def block
 # @user= User.find_by(id: params[:id])
@user.update(blocked: @user.blocked.eql?(0) ? 1 : 0) if @user.present?
redirect_to client_management_admin_index_path
end

def manage_client
	 # binding.pry
	 unless params[:data].present?
	@user=User.find(params[:id])
	@wallet=@user.wallet
else
	@user=User.find(params[:data])
	@wallet=@user.wallet
	render json: @wallet
end

end
def balance_update
	@user=User.find_by(id: params[:user][:id])
	@user.wallet.update(current_balance: (@user.wallet.current_balance+params[:user][:top_up].to_i))
    redirect_to manage_client_admin_index_path(id: params[:user][:id]) ,notice: "successfully update"
end

 private

  def edit_params
		params.require(:user).permit(:client_name,:user_name,:email,comission_attributes: [:id, :to_wallet,:to_bank,:to_mobile, :_destroy])
	end


	def client_params
		params.require(:user).permit(:client_name,:user_name,:email,:role,:password,comission_attributes: [:id, :to_wallet,:to_bank,:to_mobile, :_destroy])
	end

end
