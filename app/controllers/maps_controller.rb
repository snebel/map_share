class MapsController < ApplicationController
	before_filter :authenticate_user!, except: [:index]

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
  			marker.infowindow("#{place.title}: #{place.description}")
			end
	end

	def edit
		@map = Map.find(params[:id])
		if current_user != @map.user
			redirect_to map_path(@map)
			# flash "sorry, you can't edit this map"
			alert	  	
	  end
	  @place = Place.new
	  @places = @map.places
	  if @map.places.any?
			@hash = 
				Gmaps4rails.build_markers(@places) do |place, marker|
	  			marker.lat place.lat
	  			marker.lng place.lng
	  			marker.infowindow("#{place.title}: #{place.description}")
				end
		else
			# {:lat=>@map.center_lat, :lng=>@map.center_lng, :infowindow=>@map.city}
			@hash = []
		end

	end

	def update
		map = Map.find(params[:id])
		map.title = params[:map][:title]
		map.save
		redirect_to root_path
	end

	def destroy
		Map.find(params[:id]).delete
		redirect_to root_path
	end

	def merge
		map1 = Map.find(params[:map1][:id])
		map2 = Map.find(params[:map2][:id])
		map2.merge(map1)
		flash[:notice] = "map1 successfully merged into map 2."
		redirect_to root_path
	end

end

private
  def map_params
    params.require('map').permit(:title, :city, :user_id)
  end