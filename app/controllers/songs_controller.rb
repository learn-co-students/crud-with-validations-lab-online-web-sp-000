class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end
  
  def show
  end

  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "You've got a new song!"
      redirect_to song_path(@song)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end
  

  def update
      if @song.update(song_params)
        flash[:success] = "Song was successfully updated"
        redirect_to song_path(@song)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    if @song.destroy
      flash[:success] = 'Song was successfully deleted.'
      redirect_to songs_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to songs_path
    end
  end
  
  private
  
  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :genre, :released)
  end

end
