class SongsController < ApplicationController

    def new
        @song = Song.new
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def destroy
        Song.sing(params[:id])
    end
end
