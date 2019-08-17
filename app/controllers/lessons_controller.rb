class LessonsController < ApplicationController
	def index
		@lessons = Lesson.where(department_id: params[:department_id])
		@department = Department.find(params[:department_id])
	end

	def ranking
		@department = Department.find(params[:department_id])
		@lessons = Lesson.where(department_id: params[:department_id])

		sum_of_number = 0
		@lessons.each do |l|
			@comments = l.comments
			@comments.each do |c|
				sum_of_number = sum_of_number + c.star
				@star_average = sum_of_number / @comments.count
			end
		end
	end


	def select
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
			redirect_to complete_lesson_comments_path(@lesson.id)
		else
			render :new
		end
	end


	private
	def lesson_params
		params.require(:lesson).permit(:lesson_name, comments_attributes: [:id, :customer_id, :star, :professor, :attendance, :textbook, :exam, :exam_image, :comment, :_destroy])
	end
end
