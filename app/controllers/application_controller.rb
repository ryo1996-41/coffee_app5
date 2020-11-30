class ApplicationController < ActionController::Base

before_action :set_current_user



  def set_current_user
    @current_user = User.find_by(id:session[:user_id])
  end

  def  authenticate_user
    if @current_user == nil
    flash[:notice] = "ログインしてください"
    redirect_to("/users/login_form")
end
  end

  def forbid_login
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/users/#{@current_user.id}")
  end
end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
    flash[:notice] = "権限がありません"
    redirect_to("/users/index")
  end
end
end
