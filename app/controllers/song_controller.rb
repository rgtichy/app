class SongController < ApplicationController
  def new
  end

  def index
    @songs = Song.all
    @song = Song.new
    @song = Song.new(session[:song]) if session[:song] != nil && flash[:errors] != nil
  end

  def create
    @song = Song.new(artist: params[:song][:artist], title: params[:song][:title])
    @song.valid?
    if @song.valid?
      @song.save
      session[:song] = nil
      redirect_to song_index_path
    else
      flash[:errors] = @song.errors.full_messages
      session[:song] = @song
      redirect_to song_index_path
    end
  end

  def destroy
  end

  def show
    @song = Song.find(params[:song_id])
    @users = @song.users.select(:id,:first_name,:last_name).distinct
  end

  def update
  end
end
