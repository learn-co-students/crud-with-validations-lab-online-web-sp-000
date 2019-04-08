class SongsController < ApplicationController

  def new
    @song=Song.new
  end

  def create
    released_to_boolean
    @song=Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs=Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    released_to_boolean
    @song=Song.find(params[:id])
    if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def released_to_boolean
    params[:song][:released]=ActiveRecord::Type::Boolean.new.type_cast_from_database(params[:song][:released])
  end

end
