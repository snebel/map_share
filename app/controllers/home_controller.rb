class HomeController < ApplicationController
	def index
    @map = Map.new
		@users = User.all
	end
end