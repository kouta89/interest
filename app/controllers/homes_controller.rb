class HomesController < ApplicationController
  def top
    @likes = Like.all
    @followings = current_customer.followings
  end

  def about

  end

  def tag

  end
end
