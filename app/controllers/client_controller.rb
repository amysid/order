class ClientController < ApplicationController

	before_action :get_products
	def index
	end

	def my_profile
		@orders = current_user.orders.includes(:product)
	end

	private
	def get_products
		@products = Product.all
	end
end
