class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
  # フォロー/フォロワー一覧
  def followings
    customer = Customer.find(params[:customer_id])
    @followings = customer.followings
    @followers = customer.followers
  end
end
