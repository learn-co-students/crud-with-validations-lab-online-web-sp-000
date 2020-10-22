class SongsController < ApplicationController


  def edit
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:title, :artist_name, :genre,:release_year, :released))
    redirect_to song_path(@song)
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url

  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)

  end

end
