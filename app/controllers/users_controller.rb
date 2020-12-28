class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:index,:show,:edit,:update,:show_follow,:show_follower]}
  before_action :forbid_login,{only:[:login_form,:login,:new]}
  before_action :ensure_correct_user, {only: [:edit,:update]}

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
    @posts_likes = @user.post_likes
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice]="ユーザー登録をしました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def login_form

  end

  def login
    @user = User.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/users/index")
    else
      flash[:alert]="メールアドレスまたはパスワードが間違っています"
      render("users/login_form")
    end
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice]="編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/#{@user.id}/edit")
    end
  end

  def destroy
    @user = User.find_by(id:params[:id])
    if @user.destroy
      session[:user_id]=nil
      redirect_to("/top")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/top")
  end

  def show_follow
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def show_follower
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def show_likes
    @user = User.find_by(id:params[:id])
    @posts_likes = @user.post_likes
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :introduce,:password)
  end
end
