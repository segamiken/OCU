class Admin::LessonsController < ApplicationController
	def index
		@lessons = Lesson.where(department_id: params[:department_id]).paginate(page: params[:page], per_page: 10)
		@department = Department.find(params[:department_id])
	end

	def destroy
		@lesson = Lesson.find(params[:id])
		@department = @lesson.department
		@lesson.destroy
		redirect_to admin_department_lessons_path(@department.id)
	end
end
