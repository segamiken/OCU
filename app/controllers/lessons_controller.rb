class LessonsController < ApplicationController
	def index
		@lessons = Lesson.where(department_id: params[:department_id]).paginate(page: params[:page], per_page: 10)
		@department = Department.find(params[:department_id])
	end

	def ranking
		@department = Department.find(params[:department_id])
		@lessons = Lesson.where(department_id: params[:department_id])
	end


	def select
		@lessons = Lesson.where(department_id: params[:department_id]).paginate(page: params[:page], per_page: 10)
		@department = Department.find(params[:department_id])
	end

	def new
		@lesson = Lesson.new
		@comment = @lesson.comments.build
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.department_id = Department.find(params[:department_id]).id
		@department = Department.find(params[:department_id])
		@comment = @lesson.comments
		@comment.each do |c|
			c.customer_id = current_customer.id
		end
		if @lesson.save
			redirect_to department_lessons_path(@department.id)
		else
			render :new
		end
	end

	def images
		@lesson = Lesson.find(params[:id])
		@comments = @lesson.comments
	end


	private
	def lesson_params
		params.require(:lesson).permit(:lesson_name, comments_attributes: [:id, :customer_id, :star, :professor, :attendance, :textbook, :exam, :exam_image, :comment, :_destroy])
	end
end
