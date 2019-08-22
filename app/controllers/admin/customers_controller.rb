class Admin::CustomersController < ApplicationController
	def index
		@customers = Customer.where(deleted: nil).paginate(page: params[:page], per_page: 20)
    	@deleted_customers = Customer.where(deleted: true).paginate(page: params[:page], per_page: 20)
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
		@comments = @customer.comments.paginate(page: params[:page], per_page: 5)
	end

	def delete
		customer = Customer.find(params[:customer_id])
		customer.update(deleted: true)
		redirect_to admin_customers_path
	end

	private
	def customer_params
		params.require(:customer).permit(:email, :customer_name, :customer_introduction)
	end
end
