class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :release, :released_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update

    @song.assign_attributes(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def edit
	end

  private

  def set_song!
      @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
