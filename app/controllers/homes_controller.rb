class HomesController < ApplicationController
  def top
    @likes = Like.all.page(params[:page]).per(5)
  end

  def about

  end

  def index
    @tag_list = Tag.all.page(params[:page]).per(15)
  end

end
