class FucultiesController < ApplicationController

	def index
		@fuculties = Fuculty.all
	end

	def new
		@fuculties = Fuculty.all
	end
end
