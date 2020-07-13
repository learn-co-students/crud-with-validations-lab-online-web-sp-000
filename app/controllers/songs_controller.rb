class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        route_after_validity_check(:new)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        route_after_validity_check(:edit)
    end

    def destroy
        @song = Song.find(params[:id]).destroy
        redirect_to songs_url
    end

    private
    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def route_after_validity_check(*render_route)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render(*render_route)
        end
    end

end
