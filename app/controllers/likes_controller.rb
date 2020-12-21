class LikesController < ApplicationController


  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:id]
    )
    @like.save
    redirect_to("/posts/index")
  end

  def destroy
    @like =Like.find_by(post_id: params[:id],user_id: @current_user.id)
    @like.destroy
    redirect_to("/posts/index")
  end
end
