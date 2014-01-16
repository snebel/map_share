class RequestsController < ApplicationController
  def create
    req = Request.create(
      map_id: params[:map][:id],
      from_user: current_user.id,
      # user_id: receiving user's id
      user_id: params[:user][:id],
      verb: "share"
    )
    
    flash[:notice] = "Map sent to #{User.find(req.user_id).email} successfully!"
    redirect_to root_path
  end

  def destroy
    Request.find(params[:id]).delete
    redirect_to root_path
  end

  def copy
    req = Request.find(params[:id])
    map = Map.find(req.map_id)
    current_user.add_map_copy(map)
    req.delete
    redirect_to root_path
  end

  def ask_for_map
    #binding.pry
    map = Map.find(params[:map_id])
    Request.create(
      map_id: map.id,
      from_user: current_user.id,
      user_id: map.user_id,
      verb: "follow"
    )
    redirect_to maps_path
  end

  def allow
    #binding.pry
    req = Request.find(params[:id])
    user = User.find(req.from_user)
    map = Map.find(req.map_id)
    # change this to actually allow following?
    user.add_map_copy(map)
    req.delete
    redirect_to root_path
  end
end


