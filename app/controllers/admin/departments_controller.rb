class Admin::DepartmentsController < ApplicationController
	def show
		@departments = Department.where(fuculty_id: params[:fuculty_id])
		@fuculty = Fuculty.find(params[:fuculty_id])
	end

end
