class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user

  end

  def edit
    @post = Post.find_by(id: params[:id])

  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to("/posts/#{@post.id}")
    else
      render("posts/#{@post.id}/edit")
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save!
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  private
  def post_params
    params.require(:post).permit(:roast,:region,:content,:image,:user_id,:rate)
  end
end
