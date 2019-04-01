class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(params[:song].keys))
    @song.save ? redirect_to(song_path(@song)) : render(:new)

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(params[:song].keys)) ? redirect_to(song_path(@song)) : render(:edit)
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
