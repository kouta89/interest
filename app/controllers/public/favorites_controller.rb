class Public::FavoritesController < ApplicationController

  def create
    @like_favorite = Favorite.new(customer_id: current_customer.id, like_id: params[:like_id])
    @like_favorite.save
    redirect_to like_path(params[:like_id])
  end

  def destroy
    @like_favorite = Favorite.find_by(customer_id: current_customer.id, like_id: params[:like_id])
    @like_favorite.destroy
    redirect_to like_path(params[:like_id])
  end

end
