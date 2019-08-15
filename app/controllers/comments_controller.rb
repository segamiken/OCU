class CommentsController < ApplicationController
	def index
		@comments = Comment.where(lesson_id: params[:lesson_id])
		@lesson = Lesson.find(params[:lesson_id])
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



	private
	def comment_params
		params.require(:comment).permit(:star, :professor, :attendance, :textbook, :exam, :comment)
	end
end
