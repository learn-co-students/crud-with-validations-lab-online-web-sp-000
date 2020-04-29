class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  
  end

  def edit
    
  end
  private
  
  def song_params
    params.permit(:title, :release_year, :released, :artist_name, :genre)
  end
end
