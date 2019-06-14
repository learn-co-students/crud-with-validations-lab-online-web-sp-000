class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :new,:create, :edit, :update]

  def new
  end

  def edit
  end

  def show
  end

  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))

    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    Song.destroy(params[:id])
    redirect_to songs_path
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def set_song!
    if params[:id].nil?
      @song = Song.new
    else
      @song = Song.find(params[:id])
    end
  end

end
