class FavoritesController < ApplicationController
	def create
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find(params[:comment_id])
		@favorite = current_customer.favorites.new(comment_id: @comment.id)
		if @favorite.save
			@comments = Comment.where(lesson_id: params[:lesson_id])
			sum_of_number = 0
			@comments.each do |c|
				if c.star.present?
					sum_of_number += c.star
				end
			end
			@star_average = sum_of_number / @comments.count.to_f
			render 'create.js.erb'
		end
	end

	def destroy
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find(params[:comment_id])
		@favorite = current_customer.favorites.find_by(comment_id: @comment.id)
		if @favorite.destroy
			@comments = Comment.where(lesson_id: params[:lesson_id])
			sum_of_number = 0
			@comments.each do |c|
				if c.star.present?
					sum_of_number += c.star
				end
			end
			@star_average = sum_of_number / @comments.count.to_f
			render 'destroy.js.erb'
		end
	end

end
