class SessionController < ApplicationController
  skip_before_action :logged_in
  def create
    email = params[:login]
    email.downcase!
    @user = User.find_by_email(email).try(:authenticate, params[:password])
    if @user
      reset_session
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to song_index_path, notice: "#{@user.name} successfully logged in."
    else
      flash[:errors] = ['login/password not valid']
      redirect_to login_path
    end
  end

  def destroy
    if session[:user_id] != nil
      flash[:notice] = "#{session[:name]} successfully logged out."
      reset_session
      redirect_to root_path
    end
  end

  def index
    @user = User.new
    @user = User.new(session[:user]) if flash[:errors] != nil && session[:user] != nil
  end
end
