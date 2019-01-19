class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.delete
    redirect_to songs_path
  end

end
