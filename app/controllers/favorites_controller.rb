class FavoritesController < ApplicationController
	def create
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find(params[:comment_id])
		@favorite = current_customer.favorites.new(comment_id: @comment.id)
		if @favorite.save
			@comments = Comment.where(lesson_id: params[:lesson_id])
			render 'create.js.erb'
		end
	end

	def destroy
		@lesson = Lesson.find(params[:lesson_id])
		@comment = Comment.find(params[:comment_id])
		@favorite = current_customer.favorites.find_by(comment_id: @comment.id)
		if @favorite.destroy
			@comments = Comment.where(lesson_id: params[:lesson_id])
			render 'destroy.js.erb'
		end
	end

end
