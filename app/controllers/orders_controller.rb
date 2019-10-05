class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def new
	end

	def create
		product = Product.find(params[:product_id])
		order = product.orders.new(order_params)
		if order.save
			flash[:success] = "Order has been placed!"
		else
			flash[:error] = "Something went wrong!"
		end
		redirect_to root_path
	end

	def approve_order
     @orders = Order.where(status: "Approve")

    end 

	private
	def order_params
		params.require(:order).permit(:image, :file, :comment, :user_id)
		# params.require(:order).permit(:image, :comment, :user_id)
	end
end
