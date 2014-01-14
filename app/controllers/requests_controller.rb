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
end
