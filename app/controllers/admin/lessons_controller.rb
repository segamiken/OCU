class Admin::LessonsController < ApplicationController
	def index
		@lessons = if params[:search]
			Lesson.where(department_id: params[:department_id]).where('lesson_name LIKE?',"%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
			else
			Lesson.where(department_id: params[:department_id]).paginate(page: params[:page], per_page: 10)
		end
		@department = Department.find(params[:department_id])
	end

	def destroy
		@lesson = Lesson.find(params[:id])
		@department = @lesson.department
		@lesson.destroy
		redirect_to admin_department_lessons_path(@department.id)
	end
end
