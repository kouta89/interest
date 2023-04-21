class Public::CommentsController < ApplicationController
  def create
    like = Like.find(params[:like_id])
    comment = current_customer.comments.new(comment_params)
    comment.like_id = like.id
    comment.save
    redirect_to like_path(like)
  end

  def destroy
    Comment.find_by(id: params[:id],like_id: params[:like_id]).destroy
    like = Like.find(params[:like_id])
    redirect_to like_path(like)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :like_id, :customer_id, :parent_id)
  end
end
