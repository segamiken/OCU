class FavoritesController < ApplicationController
	def create
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find(params[:comment_id])
		@favorite = current_customer.favorites.new(comment_id: @comment.id)
		@comments = Comment.where(lesson_id: params[:lesson_id]).paginate(page: params[:page], per_page: 3)

		if @favorite.save
			@comments_all = Comment.where(lesson_id: params[:lesson_id])
			sum_of_number = 0
			@comments_all.each do |c|
				if c.star.present?
					sum_of_number += c.star
				end
			end
			@star_average = sum_of_number / @comments_all.count.to_f
			redirect_to lesson_comments_path(@lesson.id)
		end
	end

	def destroy
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find(params[:comment_id])
		@favorite = current_customer.favorites.find_by(comment_id: @comment.id)
		@comments = Comment.where(lesson_id: params[:lesson_id]).paginate(page: params[:page], per_page: 3)
		if @favorite.destroy
			@comments_all = Comment.where(lesson_id: params[:lesson_id])
			sum_of_number = 0
			@comments_all.each do |c|
				if c.star.present?
					sum_of_number += c.star
				end
			end
			@star_average = sum_of_number / @comments_all.count.to_f
			redirect_to lesson_comments_path(@lesson.id)
		end
	end

end
