class SongsController < ApplicationController

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end
    
    def edit
        set_song_by_id 
    end
    
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
        set_song_by_id 
    end

    def update
        set_song_by_id.update(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :edit
        end        
    end

    private

        def set_song_by_id 
            @song = Song.find(params[:id])
        end

        def song_params
            params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
        end
end
