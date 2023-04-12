class Public::CommentsController < ApplicationController
  def create
    like = Like.find(params[:like_id])
    comment = current_customer.comments.new(comment_params)
    comment.like_id = like.id
    comment.save
    redirect_to like_path(like)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to like_path(params[:like_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
