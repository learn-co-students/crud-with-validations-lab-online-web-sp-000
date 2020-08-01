class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end

    def show
        @song = Song.find(params[:id])
        if !@song.valid?
            redirect_to songs_path
        end
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render 'new'
        end
    end

    def edit
        @song = Song.find(params[:id])
        if !@song.valid?
            redirect_to songs_path
        end 
    end

    def update
        @song = Song.find(params[:id])
        if @song.valid?
            @song.update(song_params)
            @song.save
            redirect_to song_path(@song)
        else
            redirect_to edit_song_path(@song)
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    def song_params
        params.permit(:title, :artist_name, :genre, :released, :release_year)
    end
end
