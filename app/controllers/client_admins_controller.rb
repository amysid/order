class ClientAdminsController < ApplicationController

	def index
     @orders = Order.where(status: "Approve")
		
	end  
end