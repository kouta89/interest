class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @likes = @customer.likes
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:like_id)
    @like_Favorites = Like.find(favorites)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.valid?
      @customer.update(update_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def update_params
    params.require(:customer).permit(:image, :name, :profile)
  end

end
