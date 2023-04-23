class HomesController < ApplicationController
  def top
    # いいねの数が多い人気のページ順に表示
    likes = Like.includes(:favorites).sort {|a,b| b.favorites.count <=> a.favorites.count}
    @likes = Kaminari.paginate_array(likes).page(params[:page]).per(5)
  end

  def about

  end

  def index
    @tag_list = Tag.all.page(params[:page]).per(15)
  end

end
