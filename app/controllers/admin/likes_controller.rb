class Admin::LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to costomers_path
  end
end
