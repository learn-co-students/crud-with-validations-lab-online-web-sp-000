class SongsController < ApplicationController
    
    def index
        @songs = Song.all
    end

    def show
        assign_song
    end

    def edit
        assign_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        assign_song
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        assign_song.destroy
        redirect_to songs_path
    end

    private

    def assign_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end
end