require 'pry'
class SongsController < ApplicationController


    def new 
        @song = Song.new(song_params)
    end 

    def index 
        @songs = Song.all 
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

    def show 
        @song = Song.find(params[:id])
    end

    def edit 
        @song = Song.find(params[:id])
        binding.pry 
        @song.update(song_params)
        if @song.valid?
            @song.save 
        else 
            render :edit 
        end 
    end 









    private 

    def song_params
        params.require(:song).permit!
    end 
end
