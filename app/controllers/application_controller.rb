class ApplicationController < ActionController::Base
#	protect_from_forgery
	include Pagy::Backend
	#rescue_from Exception, with: :catch_error
	#layout 'admin' , only: [:my_profile]
	require 'will_paginate/array'
	# before_action :authenticate_user! , only: [:my_profile,:update_profile]
	protect_from_forgery with: :exception, unless: -> { request.format.json?}

	helper_method :current_user

	before_action :user_to_root

	def current_user
		@current_user ||= request.env['warden'].user
		# @current_user ||= User.find_by(id: session[:user_id])
	end
	def find_user
		@user= User.find_by(id: params[:id])
	end
	# def authenticate_user!
	# 	redirect_to admin_panel_path unless current_user.present?
	# end
	# def authenticate_employee!
	# 	redirect_to root_path unless current_user.present?
	# end
	def my_profile
		@user = current_user
	end


	def user_to_root
		root_path #if current_user
	end
	# def redirect_by_role(user)
		# root_path
	#	binding.pry
		# if user.role.eql?("Super Admin")
		# 	"/admin"
		# elsif user.role.eql?("Client Admin")
		# 	"/client"
		# else
		# 	"/users" #if user.role.eql?("Employee")
		# end
	# end

	# def check_user
	# #	redirect_to logout_path unless current_user.blocked!=1
	# 	session[:user_id] = nil
	# 	return redirect_to root_path if current_user.blocked==1
	# end

	# def verify_user
	# 	#binding.pry
	# 	redirect_to client_index_path if current_user.present?&&current_user.role=="Client Admin"
	# #	redirect_to employee_index_path if current_user.present?&&current_user.role=="Employee"
	# end

	private
	def profile_update
		params.require(:user).permit(:client_name,:email,:password )
	end


	def catch_error(exception)
       	arr = arr = exception.backtrace.select { |x| x.match(/digitalwallet-18113426-ror/) }
		arr = arr.map{ |x| x.match(/^(.+?):(\d+)(|:in `(.+)')$/);
 		 [$1,$2,$4]
		}
      	redirect_to error_message_errors_path(err: exception,params_details: params.to_json,error_details: arr.to_json)
    end
end
