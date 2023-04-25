class Admin::LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to costomers_path
  end
end
