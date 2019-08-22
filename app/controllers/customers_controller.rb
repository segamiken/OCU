class CustomersController < ApplicationController
	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
		if @customer.id != current_customer.id
			redirect_to customer_path(current_customer.id)
		end
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
		   redirect_to customer_path(current_customer.id)
		elsif
		   render :edit
		end
	end

	def comments
		@customer = Customer.find(params[:id])
		@comments = @customer.comments.paginate(page: params[:page], per_page: 5)
	end


	private
	def customer_params
		params.require(:customer).permit(:email, :customer_name, :customer_introduction)
	end
end
