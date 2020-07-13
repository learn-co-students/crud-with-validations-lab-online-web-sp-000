class SongsController < ApplicationController

    def index
        @songs=Song.all
    end

    def show
        set_song
    end

    def new
        @song=Song.new
    end

    def edit
        set_song
    end

    def create
        @song=Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        
        set_song
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end

    def destroy
        set_song
        @song.delete
        redirect_to songs_path
    end

    end

private 
    def set_song
      @song=Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title,:artist_name,:released, :release_year, :genre)
    end
end
