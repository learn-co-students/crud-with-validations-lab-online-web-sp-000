class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        show_song
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

    def edit
        show_song
    end

    def update
        show_song

        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        show_song.destroy
        redirect_to songs_path
      end

    private

    def show_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
      end

end
