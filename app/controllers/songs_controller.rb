class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
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
        @song = Song.find(params[:id])
        if @song.valid?
            @song.update(song_params)
            binding.pry
            redirect_to song_path(@song)
        else
            binding.pry
            render :edit
        end
    end

    private
    
        def song_params
            params.require(:song).permit(:title, :released, :artist_name)
        end

end
