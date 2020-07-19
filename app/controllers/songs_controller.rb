class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
        render 'edit'
    end

    def new
        @song = Song.new
        render 'new'
    end

    def create
        @song = Song.new(secure_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render 'new'
        end
    end

    def update
        @song = Song.find(params[:id])
        @song.assign_attributes(secure_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render 'edit'
        end
    end

    def destroy
        Song.destroy(params[:id])
        redirect_to songs_path
    end

    private

    def secure_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
