class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :delete]
    
    def index
        @songs = Song.all
    end

    def show

    end

    def new
        @song = Song.new
    end

    def create

    end

    def edit

    end

    def update

    end

    def delete

    end

    private

    def set_song
        @song = Song.find(params[:id])
    end
end
