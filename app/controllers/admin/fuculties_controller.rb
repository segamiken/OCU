class Admin::FucultiesController < ApplicationController
	def index
		@fuculties = Fuculty.all
	end

	def new
		@fuculty = Fuculty.new
		@department = @fuculty.departments.build
	end

	def create
		@fuculty = Fuculty.new(fuculty_params)
		if @fuculty.save
			redirect_to admin_fuculties_path
		else
			render :new
		end
	end

	def edit
		@fuculty = Fuculty.find(params[:id])
	end

	def update
		@fuculty = Fuculty.find(params[:id])
		if @fuculty.update(fuculty_params)
			redirect_to admin_fuculties_path
		else
			render :edit
		end
	end

	def destroy
		@fuculty = Fuculty.find(params[:id])
		@fuculty.destroy
		redirect_to admin_fuculties_path
	end


	private
	def fuculty_params
		params.require(:fuculty).permit(:fuculty_name, departments_attributes: [:id, :fuculty_id, :department_name , :_destroy])
	end

end
