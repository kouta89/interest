class Public::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(customer_id: current_customer.id, like_id: params[:like_id])
    @like = @favorite.like
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, like_id: params[:like_id])
    @like = @favorite.like
    @favorite.destroy
  end
end
