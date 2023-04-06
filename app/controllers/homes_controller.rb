class HomesController < ApplicationController
  def top
    @likes = Like.all
  end

  def about

  end
end
