class PlaylistController < ApplicationController
  def create
    Playlist.create(user: User.find(params[:user_id]), song: Song.find(params[:song_id]))
    redirect_to song_index_path
  end

  def show
  end
end
