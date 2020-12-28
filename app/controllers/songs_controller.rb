class SongsController < ApplicationController
 def index
    @songs = Song.all
 end

 def show
 end

 def new
 end

 def edit
 end

 def create
 end

 def update
 end

 def destroy
    @song.Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
 end
 private

 def song_params
 end
end