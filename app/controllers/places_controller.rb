class PlacesController < ApplicationController
  def create
    place = Place.create(place_params)
    map = Map.find(place.map_id)
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
    params.require('place').permit(:title, :address, :link, :description, :map_id)
  end