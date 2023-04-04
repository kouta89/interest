class Public::LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def index
    @likes = Like.all
  end

  def create
    @like = Like.new(like_params)
    @like.customer_id = current_customer.id
    @like.tag_id = 1
    if @like.save
      flash.now[:success] = "商品の新規登録が完了しました。"
      redirect_to like_path(@like)
    else
      flash.now[:danger] = "商品の新規登録に失敗しました。"
      render :new
    end
  end

  def show
    @like = Like.find(params[:id])
  end

  def edit
    @like = Like.find(params[:id])
  end

  def update
    @like = Like.find(params[:id])
    if @like.update(like_params)
      flash[:success] = "商品の更新が完了しました。"
      redirect_to likes_path(@like)
    else
      flash[:danger] = "商品の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to likes_path
  end

  private

  def like_params
    params.require(:like).permit(:customer_id, :tag_id, :name, :introduction, :image)
  end

end
