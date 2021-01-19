class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_post_user,{only:[:edit,:update,:destroy]}


  def index
    @posts = Post.all.order(created_at: :desc)
  
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes = @post.likes
    @comments = @post.comments
    @comenter = User.all
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    if @post.destroy
      redirect_to("/posts/index")
    end
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

  def follow_index
    @users = User.find_by(id:params[:id]).following
  end

  private
  def post_params
    params.require(:post).permit(:roast, :region, :content, :image, :user_id, :rate)
  end
end
