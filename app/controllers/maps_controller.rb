class MapsController < ApplicationController
	before_filter :authenticate_user!, except: [:index]

	def new
		@map = Map.new
	end

	def create
		map = Map.create(title: params[:map][:title], city: params[:map][:city])
		# geocode params[:map][:city]
		# map.center_lat = ..., map.center_lng = ...
		redirect_to edit_map_path(map)
	end

	def show
		@map = Map.find(params[:id])
	end

	def edit
		@map = Map.find(params[:id])
	  @place = Place.new
	end

	def update
		map = Map.find(params[:id])
		map.title = params[:map][:title]
		map.save
		redirect_to root_path
	end
end