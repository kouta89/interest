class Public::CommentsController < ApplicationController
  def create
    @like = Like.find(params[:like_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.like_id = @like.id
    @comments = @like.comments
    @comment_reply = @like.comments.build
    @comment.save
    # redirect_to like_path(like)
  end

  def destroy
    @like = Like.find(params[:like_id])
    @comment = Comment.find_by(id: params[:id])
    @comments = @like.comments
    @comment_reply = @like.comments.build
    if @comment != nil
      @comment.destroy
    end

    # redirect_to like_path(like)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :like_id, :customer_id, :parent_id)
  end
end
