class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :delete]
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(params[:song].keys))
      if @song.save
        redirect_to @song
      else
        render 'new'
      end
  end

  def show 
  end

  def index
    @songs = Song.all
  end

  def edit
  end

  def update
    if @song.update(song_params(params[:song].keys))
      redirect_to @song
    else
      render 'edit'
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

    def set_song
      @song = Song.find(params[:id])
    end  
end
