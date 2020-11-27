class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
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
      redirect_to("/users/index")
    else
      render("users/login_form")
    end
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.update(user_params)
    if @user.save!
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
    redirect_to("/top")
  end

private
  def user_params
     params.require(:user).permit(:name, :email, :avatar, :introduce,:password)
   end
end
