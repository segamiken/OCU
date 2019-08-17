class CommentsController < ApplicationController
	def index
		@comments = Comment.where(lesson_id: params[:lesson_id])
		@lesson = Lesson.find(params[:lesson_id])
		@cc = @lesson.comments.all
		sum_of_number = 0
		@cc.each do |c|
			sum_of_number = sum_of_number + c.star
			@star_average = sum_of_number / @cc.count
		end
	end

	def new
		@comment = Comment.new
		@lesson = Lesson.find(params[:lesson_id])
	end

	def create
		@comment = Comment.new(comment_params)
		@lesson = Lesson.find(params[:lesson_id])
		@comment.lesson_id = @lesson.id
		@comment.customer_id = current_customer.id

		if @comment.save
			redirect_to complete_lesson_comments_path(@lesson.id)
		elsif
			render :new
		end
	end

	def complete
	end

	def edit
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
	end

	def update
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
		if @comment.update(comment_params)
		   redirect_to complete_lesson_comments_path(@comment.lesson.id)
		elsif
			render :edit
		end
	end

	def destroy
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
		@comment.destroy
		redirect_to comments_customer_path(current_customer.id)
	end



	private
	def comment_params
		params.require(:comment).permit(:star, :professor, :attendance, :textbook, :exam, :comment, :exam_image)
	end
end
