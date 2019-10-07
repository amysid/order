class ProductsController < ApplicationController

	# before_action :get_products
	
	def index
		if params["search"].present?
		 @products =Product.where("name ILIKE ?", "%#{params[:search]}%")
		else	
		 @products = Product.all
        end
	end

	def new
	end	

	

	def create
    @product = Product.new(product_params)
    if @product.save
       @product.create_image(file: params[:product][:file])
      redirect_to products_path, notice: 'Product Created Successfully.'
    else
      flash[:error] = @product.errors.full_messages.first.gsub("Body","")
      render :new
    end
  end

	def show
		if current_user.present?
		@product = Product.find_by_id(params[:id])
	     else
	    redirect_to sessions_signin_path
	    flash[:error] = "Please Login First."
	    end
	end
	private
	def product_params
		params.require(:product).permit(:name, :description)
	end

	def get_products
		@products = Product.all
	end
end
