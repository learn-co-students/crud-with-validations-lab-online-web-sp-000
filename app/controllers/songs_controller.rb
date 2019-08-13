class SongsController < ApplicationController

 def index
   @songs = Song.all
   render :index
 end

 def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

 def create
   @song = Song.new(songs_params)
   # binding.pry
   if @song.save
     redirect_to song_path(@song)
     # binding.pry
   else
     render :new
   end
 end

 def edit
    @song = Song.find(params[:id])

 end

 def update
   @song = Song.find(params[:id])
     @song.update(songs_params)
     if @song.valid?
     redirect_to song_path(@song)
   else
     render :edit
   end
 end

 def destroy
   @song = Song.find_by(params[:id])
   @song.destroy
   redirect_to songs_path
 end

 private

 def songs_params
   params.require(:song).permit(:title,:released,:release_year,:artist_name,:genre)
 end

end
