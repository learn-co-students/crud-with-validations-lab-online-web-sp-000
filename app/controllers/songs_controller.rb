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
            if @song.released == true && @song.release_year != "" 
                    @song.save
                    redirect_to song_path(@song)
            else 
                render :new 
            end 
        else 
            render :new 
        end 
    end 

    def show 
        @song = Song.find(params[:id])
    end

    def edit 
        @song = Song.find(params[:id])
    end 

    def update 
        @song = Song.find(params[:id])
        @song.update(song_params)
        if @song.valid?
            @song.save 
            redirect_to song_path(@song)
        else 
            render :edit 
        end 

    def destroy 
        Song.find(params[:id]).destroy 
        redirect_to songs_path 
    end 

end 









    private 

    def song_params
        params.require(:song).permit!
    end 
end
