class SongsController < ApplicationController
    def index
      @songs = Song.all
    end

    def new
      @song = Song.new
    end

    def create
      song = Song.new(song_params)
      if song.save
        redirect_to song_path(song)
      end
    end

    def edit
      @song = Song.find(params[:id])
    end

    def update
      song = Song.find(params[:id])
      if song.update(song_params)
        redirect_to song_path(song)
      else
        render :edit
      end
    end

    def destroy
      Song.find(params[:id]).destroy
    end

  private
    def song_params
      params.permit(:title, :released, :release_year, :author_name, :genre)
    end
end
