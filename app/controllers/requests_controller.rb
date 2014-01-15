class RequestsController < ApplicationController
  def create
    #binding.pry
    Request.create(
      map_id: params[:map_id],
      from_user: params[:from_user],
      user_id: params[:user_id]
    )
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
