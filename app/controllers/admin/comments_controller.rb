class Admin::CommentsController < ApplicationController
	def index
		@lesson = Lesson.find(params[:lesson_id])
		@comments = Comment.where(lesson_id: params[:lesson_id])

		sum_of_number = 0
		@comments.each do |c|
			if c.star.present?
			sum_of_number += c.star
			end
		end
		@star_average = sum_of_number / @comments.count.to_f
	end

	def edit
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
	end

	def update
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
		if @comment.update(comment_params)
		   redirect_to admin_fuculties_path
		elsif
			render :edit
		end
	end

	def destroy
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
		@lesson = @comment.lesson
		@customer = @comment.customer
		@comment.destroy
		redirect_to comments_admin_customer_path(@customer.id)
	end

	private
	def comment_params
		params.require(:comment).permit(:star, :professor, :attendance, :textbook, :exam, :comment, :exam_image, :average_star)
	end
end
