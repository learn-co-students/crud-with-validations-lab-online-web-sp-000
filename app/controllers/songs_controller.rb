class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
    @songs = Song.all
  end

  def show
  end

  def edit
  end

  def update
    song_search.update(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def song_search
    @song = Song.find(params[:id])
  end

end
