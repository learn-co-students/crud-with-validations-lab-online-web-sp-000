class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        # binding.pry
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
        set_song
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        set_song
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        set_song
        @song.destroy

        redirect_to songs_path
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
    end
end
