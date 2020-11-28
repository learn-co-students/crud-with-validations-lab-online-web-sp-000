class SongsController < ApplicationController
  
  def index
    @songs = Song.all 
  end 
  
  def show
    finder
  end 
  
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
    finder
  end
  
  def update
    finder
    @song.update(song_params)
    if @song.valid?
      @song.save 
      redirect_to song_path(@song)
    else
      render :edit
    end 
  end
  
  def destroy
    finder.destroy
    redirect_to songs_path
  end
  
  private
  
    def finder
      @song = Song.find(params[:id])
    end 
    
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
      
end
