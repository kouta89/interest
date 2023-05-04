class Public::LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def index

    if params[:latest]
      likes = Like.latest
      @likes = Kaminari.paginate_array(likes).page(params[:page]).per(5)
    elsif params[:old]
      likes = Like.old
      @likes = Kaminari.paginate_array(likes).page(params[:page]).per(5)
    else
      likes = Like.all
      @likes = Kaminari.paginate_array(likes).page(params[:page]).per(5)
    end

    @tag_list = Tag.all
  end

  def create

    @like = Like.new(like_params)
    @like.customer_id = current_customer.id
    tag_list = params[:like][:tag_name].split(",")

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
    @comment_reply = @like.comments.build #コメントに対する返信用の変数
    @comment = Comment.new
  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @likes = @tag.likes.all  #クリックしたタグに紐付けられた投稿を全て表示
  end

  def edit
    @like = Like.find(params[:id])
    if @like.customer == current_customer
      render "edit"
    else
      redirect_to likes_path
    end
    # pluckはmapと同じ意味
    @tag_list=@like.tags.pluck(:tag_name).join(',')
  end

  def update
    @like = Like.find(params[:id])
    tag_list=params[:like][:tag_name].split(',')
    if @like.update(like_params)
      @like.save_tag(tag_list)
      flash[:success] = "更新が完了しました。"
      redirect_to like_path(@like)
    else
      flash[:danger] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to root_path
  end

  private

  def like_params
    params.require(:like).permit(:customer_id, :name, :introduction, :image)
  end

end
