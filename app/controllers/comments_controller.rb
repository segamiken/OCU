class CommentsController < ApplicationController
	def index
		@comment = Comment.new
		@lesson = Lesson.find(params[:lesson_id])
		@comments = @lesson.comments.all

		sum_of_number = 0
		@comments.each do |c|
			if c.star.present?
			sum_of_number += c.star
			end
		end
		@star_average = sum_of_number / @comments.count.to_f
	end

	def new
		@comment = Comment.new
		@lesson = Lesson.find(params[:lesson_id])
	end

	def create
		@comments = Comment.where(lesson_id: params[:lesson_id])
		@comment = Comment.new(comment_params)
		@lesson = Lesson.find(params[:lesson_id])
		@comment.lesson_id = @lesson.id
		@comment.customer_id = current_customer.id

		if @comment.save
			@comments = Comment.where(lesson_id: params[:lesson_id])
			render 'comment.js.erb'
		else
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
