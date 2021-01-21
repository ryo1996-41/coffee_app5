class LikesController < ApplicationController


  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:id]
    )
    @like.save
  end

  def destroy
    @like = Like.find_by(post_id: params[:id],user_id: @current_user.id)
    @like.destroy
  end
end
