class MapsController < ApplicationController
	before_filter :authenticate_user!, except: [:index]

	def new
		@map = Map.new
	end

	def create
		map = Map.create(map_params)
		# geocode params[:map][:city]
		# map.center_lat = ..., map.center_lng = ...
		redirect_to edit_map_path(map)
	end

	def show
		@map = Map.find(params[:id])
		@places = @map.places
		@hash = 
			Gmaps4rails.build_markers(@places) do |place, marker|
  			marker.lat place.lat
  			marker.lng place.lng
  			marker.infowindow place.title
			end
	end

	def edit
		@map = Map.find(params[:id])
		if current_user != @map.user
			redirect_to root_path
			alert	  	
	  end
	  @place = Place.new
	  @places = @map.places
		@hash = 
			Gmaps4rails.build_markers(@places) do |place, marker|
  			marker.lat place.lat
  			marker.lng place.lng
  			marker.infowindow place.title
			end
	end

	def update
		map = Map.find(params[:id])
		map.title = params[:map][:title]
		map.save
		redirect_to root_path
	end
end

private
  def map_params
    params.require('map').permit(:title, :city, :user_id)
  end