class SongsController < ApplicationController
    before_action :get_song

    def index
        @songs = Song.all
    end

    def show
    end

    def edit
    end

    def update
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
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

    def destroy
        @song.destroy
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit!
    end

    def get_song
        @song = Song.find_by(id: params[:id])
    end
end
