class PlacesController < ApplicationController
  def create
    binding.pry
    place = Place.create(place_params)
    map_id = params[:place][:map_id]
    map = Map.find(map_id)
    MapMembership.create(map_id: map_id, place_id: place.id)
    redirect_to edit_map_path(map)
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    place = Place.find(params[:id])
    map = Map.find(place.map_id)
    place.update(place_params)
    redirect_to edit_map_path(map)
  end

  def destroy
    place = Place.find(params[:id])
    map = Map.find(place.map_id)
    Place.delete(params[:id])
    redirect_to edit_map_path(map)
  end

end

private
  def place_params
    params.require('place').permit(:title, :address, :link, :description)
  end