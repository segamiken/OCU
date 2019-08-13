class DepartmentsController < ApplicationController
	def show
		@departments = Department.where(fuculty_id: params[:fuculty_id])
	end

	def new
		@departments = Department.where(fuculty_id: params[:fuculty_id])
	end
end
