class SongsController < ApplicationController
  before_action :all_songs, only: :index
  before_action :new_song, only: :new
  before_action :get_song, only: %i[show edit update destroy]

  def index; end
  def show; end
  def new; end
  def edit; end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save

      redirect_to @song
    else

      render :'songs/new'
    end
  end

  def update
    @song.update(song_params)

    if @song.valid?
      @song.save

      redirect_to @song
    else
      render :'songs/edit'
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def all_songs
    @songs = Song.all
  end

  def new_song
    @song = Song.new
  end

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end


end
