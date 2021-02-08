class SongsController < ApplicationController
  before_action :set_song, only: [:edit, :show, :update, :delete]
  
  def index 
    @songs = Song.all 
  end 
  
  def show 
  end 
  
  def new 
  end 
  
  def edit
  end 
  
  def update 
    if @song.update(song_params)
      redirect_to song_path(@song)
    else 
      render :new
    end
  end 
  
  def delete 
  end 
  
  def create 
    if @song.create(song_params)
      redirect_to song_path(@song)
    else 
      render :new
    end
  end 
  
  private
  def set_song 
    @song = Song.find(:id)
  end 
  
  def song_params 
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
  
end
