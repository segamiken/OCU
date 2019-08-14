class LessonsController < ApplicationController
	def show
		@lessons = Lesson.where(department_id: params[:department_id])
		@department = Department.find(params[:department_id])
	end

	def new
		@lesson = Lesson.new
		@comment = @lesson.comments.build
	end


	private
	def lesson_params
		params.require(:lesson).permit(:lesson_name, comments_attributes: [:id, :star, :professor, :attendance, :textbook, :exam, :comment, :_destroy])
	end
end
