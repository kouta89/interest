class Public::LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def index
    @likes = Like.all
    @tag_list = Tag.all
  end

  def create

    @like = Like.new(like_params)
    @like.customer_id = current_customer.id
    tag_list = params[:like][:name].split(nil)

    if @like.save
      @like.save_tag(tag_list)
      flash.now[:success] = "投稿が完了しました。"
      redirect_to like_path(@like)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @like = Like.find(params[:id])
    @like_tags = @like.tags
    @comments = @like.comments
    @comment = Comment.new
  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @likes = @tag.likes.all  #クリックしたタグに紐付けられた投稿を全て表示
  end

  def edit
    @like = Like.find(params[:id])
    # pluckはmapと同じ意味
    @tag_list=@like.tags.pluck(:name).join(',')
  end

  def update
    @like = Like.find(params[:id])
    tag_list=params[:like][:name].split(',')
    if @like.update(like_params)
      @like.save_tag(tag_list)
      flash[:success] = "商品の更新が完了しました。"
      redirect_to like_path(@like)
    else
      flash[:danger] = "商品の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to costomers_path
  end

  private

  def like_params
    params.require(:like).permit(:customer_id, :name, :introduction, :image)
  end

end
