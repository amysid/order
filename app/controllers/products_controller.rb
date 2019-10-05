class ProductsController < ApplicationController

	before_action :get_products
	
	def index
	end

	def new
	end	

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "Product created successfully!"
			redirect_to products_path
		else
			flash[:error] = "Something went wrong!"
			redirect_to products_path
		end
	end

	def show
		@product = Product.find_by_id(params[:id])
	end
	private
	def product_params
		params.require(:product).permit(:name, :image, :description)
	end

	def get_products
		@products = Product.all
	end
end
