class PlacesController < ApplicationController
  def create
    place = Place.create(place_params)
    map_id = params[:place][:map_id]
    map = Map.find(map_id)
    MapMembership.create(map_id: map_id, place_id: place.id)
    redirect_to edit_map_path(map)
  end

  def edit
    @place = Place.find(params[:id])
    @map_id = params[:map_id]
  end

  def update
    place = Place.find(params[:id])
    map = Map.find(params[:map_id])
    place.update(place_params)
    map.adjust_place(place)
    redirect_to edit_map_path(map)
  end

  def destroy
    map = Map.find(params[:place][:map_id])
    MapMembership.where(place_id: params[:id], map_id: map.id).delete_all
    redirect_to edit_map_path(map)
  end

end

private
  def place_params
    params.require('place').permit(:title, :address, :link, :description)
  end