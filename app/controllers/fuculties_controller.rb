class FucultiesController < ApplicationController

	def index
		@fuculties = Fuculty.all
	end
end
