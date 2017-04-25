class UserController < ApplicationController
  skip_before_action :logged_in, only: :create
  def show
    @user = User.find(params[:id])
    @UserPlaylist = @user.songs.select(:id, :artist, :title).distinct
  end

  def update
  end

  def create
    @user = User.new( user_params )
    @user.valid?
    if @user.valid? && (@user.password == @user.password_confirmation)
      @user.save
      session[:user] = nil
      redirect_to user_show_path, id: @user.id
    else
      flash[:errors] = @user.errors.full_messages
      session[:user] = @user
      if (@user.password != @user.password_confirmation)
        flash[:errors].append("Password and Confirm Password don't match")
      end
      redirect_to session_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
