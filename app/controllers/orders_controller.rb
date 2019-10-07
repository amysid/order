class OrdersController < ApplicationController

	def index
		# binding.pry
		# if params["search"].present?
  #        @orders =  Order.where("product_name ILIKE ?", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
		# else
		 @orders = Order.all
		# end

	end

	def new
	end

	# def create1
	# 	product = Product.find(params[:product_id])
	# 	order = product.orders.new(order_params)
	# 	if order.save
	# 		flash[:success] = "Order has been placed!"
	# 	else
	# 		flash[:error] = "Something went wrong!"
	# 	end
	# 	redirect_to root_path
	# end

    def client_user
    	if params["search"].present?
		 @users =User.where("name ILIKE ?", "%#{params[:search]}%")
		else	
   	     @users = User.where.not(email: "admin@example.com")
        end
   	# @users = select * from users where email != "admin@example.com"

   end

	def create
		product = Product.find(params[:product_id])
		order = product.orders.new(order_params)
	    
	    if order.save
	    	# binding.pry
	       order.update(file: params[:order][:image])
	      redirect_to root_path, notice: 'Order Created Successfully.'
	    else
	      flash[:error] = order.errors.full_messages.first.gsub("Body","")
	      render :new
	    end
  	end

	def approve_order
     @orders = Order.where(status: "Approve")

    end 

	private
	def order_params
        params.require(:order).permit(:description,:user_id)
		
		# params.require(:order).permit(:image, :file, :comment, user_id: current_user.id)
		# params.require(:order).permit(:image, :comment, :user_id)
	end
end
