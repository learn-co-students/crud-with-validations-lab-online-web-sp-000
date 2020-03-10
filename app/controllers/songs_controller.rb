class SongsController < ApplicationController
    def index
      @songs = Song.all
    end

    def new
      @song = Song.new
    end

    def create
      @song.new(song_params)
      # if song.find()
    end

    def edit
      @song = Song.find(params[:id])
    end

    def update

    end

    def destroy

    end

  private
    def song_params
      params.permit(:title, :released, :release_year, :author_name, :genre)
    end
end
