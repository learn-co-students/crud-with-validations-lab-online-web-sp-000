class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]
    
    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end

    def change_genre
        @song = Song.new
        # binding.pry
    end

    def update_genre
        binding.pry
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end
end
