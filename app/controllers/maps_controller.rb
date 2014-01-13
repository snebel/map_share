class MapsController < ApplicationController
	def new
		@map = Map.new
	end

	def create
		map = Map.create(title: params[:map][:title], city: params[:map][:city])
		# geocode params[:city]
		# map.center_lat = ..., map.center_lng = ...
		redirect_to edit_map_path(map)
	end

	def show
		@map = Map.find(params[:id])
	end

	def edit
		@map = Map.find(params[:id])
	end
end