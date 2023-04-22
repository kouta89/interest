class Public::RelationshipsController < ApplicationController

  # フォローするとき
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
  end

  # フォロー外すとき
  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
  end

  # フォロー/フォロワー一覧
  def index
    customer = Customer.find(params[:customer_id])
    @followings = customer.followings
    @followers = customer.followers
  end
end
