class HomesController < ApplicationController
  def top
    @likes = Like.all
  end

  def about

  end

  def index
    @tag_list = Tag.all 
  end
  
end
