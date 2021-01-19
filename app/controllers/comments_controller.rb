class CommentsController < ApplicationController

  def create
    @comenter = User.all
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    @comment.save
    @comments = Comment.where(post_id: @comment.post_id)
  end


  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:Content, :post_id)
  end
end
