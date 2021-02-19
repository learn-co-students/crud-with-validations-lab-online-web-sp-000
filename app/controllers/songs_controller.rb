class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    # require 'pry'; binding.pry
    @song = Song.find(params[:id])
    if @song.update(songs_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show

  end

  private

  def songs_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end
end
