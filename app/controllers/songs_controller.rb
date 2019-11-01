class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    en

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])
        if @song.valid?
            @song.update(song_params)
            redirect_to song_path(@song)
        else 
            render :edit
        end
    end

    def update
        
    end

    private

    def song_params
        params.permit!
    end
end
