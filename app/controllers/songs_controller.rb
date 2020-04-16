class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
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

    def show
    end

    def edit
    end

    def update
        @song.update(song_params)
        if @song.save
        redirect_to song_path(@song)
        else
        render :edit
        end
    end

    def destroy
        @song.destroy!
        redirect_to '/songs'
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
    end

    def set_song!
        @song = Song.find(params[:id])
    end
end
