class RequestsController < ApplicationController
  def create
    #binding.pry
    Request.create(
      map_id: params[:map][:id],
      from_user: current_user.id,
      # user_id: receiving user's id
      user_id: params[:user][:id]
    )
    #binding.pry
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
end
