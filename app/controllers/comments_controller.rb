class CommentsController < ApplicationController

	def index
		@comment = Comment.new
		@lesson = Lesson.find(params[:lesson_id])
		@comments = @lesson.comments.paginate(page: params[:page], per_page: 3)

		@comments_all = @lesson.comments.all
		sum_of_number = 0
		@comments_all.each do |c|
			if c.star.present?
			sum_of_number += c.star
			end
		end
		@star_average = sum_of_number / @comments_all.count.to_f
	end

	def create
		@comments = Comment.where(lesson_id: params[:lesson_id]).paginate(page: params[:page], per_page: 3)

		@comment = Comment.new(comment_params)
		@lesson = Lesson.find(params[:lesson_id])
		@comment.lesson_id = @lesson.id
		@comment.customer_id = current_customer.id

		@comments_all = Comment.where(lesson_id: params[:lesson_id])
		sum_of_number = 0
		@comments_all.each do |c|
			if c.star.present?
			sum_of_number += c.star
			end
		end
		@star_average = sum_of_number / @comments_all.count.to_f
		@comment.average_star = @star_average.to_f


		if @comment.save
			@comments = Comment.where(lesson_id: params[:lesson_id]).paginate(page: params[:page], per_page: 3)
			@comments_all = Comment.where(lesson_id: params[:lesson_id])
			sum_of_number = 0
			@comments_all.each do |c|
				if c.star.present?
					sum_of_number += c.star
				end
			end
			@star_average = sum_of_number / @comments_all.count.to_f
			render 'comment.js.erb'
		else
			render 'error.js.erb'
		end
	end


	def complete
	end

	def edit
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
	end

	def update
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
		@lesson = @comment.lesson
		if @comment.update(comment_params)
		   redirect_to lesson_comments_path(@lesson.id)
		elsif
			render :edit
		end
	end

	def destroy
		@comment = Comment.find_by(lesson_id: params[:lesson_id], id: params[:id])
		@lesson = @comment.lesson
		@comment.destroy
		redirect_to lesson_comments_path(@lesson.id)
	end



	private
	def comment_params
		params.require(:comment).permit(:star, :professor, :attendance, :textbook, :exam, :comment, :exam_image)
	end
end
