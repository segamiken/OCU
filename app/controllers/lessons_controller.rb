class LessonsController < ApplicationController
	def show
		@lessons = Lesson.where(department_id: params[:department_id])
		@department = Department.find(params[:department_id])
	end

	def new
		@lesson = Lesson.new
		@comment = @lesson.comments.build
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.department_id = Department.find(params[:department_id]).id
		@comment = @lesson.comments
		@comment.each do |c|
			c.customer_id = current_customer.id
		end
		if @lesson.save
			redirect_to root_path
		else
			render :new
		end
	end


	private
	def lesson_params
		params.require(:lesson).permit(:lesson_name, comments_attributes: [:id, :customer_id, :star, :professor, :attendance, :textbook, :exam, :comment, :_destroy])
	end
end
