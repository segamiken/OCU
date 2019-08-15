class CustomersController < ApplicationController
	def show
		@customer = Customer.find(params[:id])
	end

	def edit
	end

	def update
	end

	def comments
		@customer = Customer.find(params[:id])
		@comments = @customer.comments.all
	end
end
