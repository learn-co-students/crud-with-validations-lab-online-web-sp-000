class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  
  def show
    
  end

  def index
    @songs = Song.all
  end

  def edit
    
  end

  private
    def song_params(*args)
      params.require(:artist).permit(*args)
    end

    def set_song
      @song = Song.find(params[:id])
    end  
end
