class Public::FavoritesController < ApplicationController

  def create
    like_favorite = Favorite.new(customer_id: current_customer.id, like_id: params[:like_id])
    like_favorite.save
    redirect_to request.referer
  end

  def index
    @like_favorites = Favorite.all
  end

  def destroy
    like_favorite = Favorite.find_by(customer_id: current_customer.id, like_id: params[:like_id])
    like_favorite.destroy
    redirect_to request.referer
  end

end
