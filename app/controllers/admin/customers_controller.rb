class Admin::CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
		   redirect_to admin_customer_path(@customer.id)
		elsif
		   render :edit
		end
	end

	def comments
		@customer = Customer.find(params[:id])
		@comments = @customer.comments
	end

	private
	def customer_params
		params.require(:customer).permit(:email, :customer_name, :customer_introduction)
	end
end
