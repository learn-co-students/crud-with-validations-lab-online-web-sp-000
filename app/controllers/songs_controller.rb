class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    def show
        @song = Song.find(params[:id])
        # binding.pry
    end
    def edit
        @song = Song.find(params[:id])
    end
    def new
        @song = Song.new
    end
    def create
		@song = Song.new(params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year))
        if @song.valid?
          @song.save
          redirect_to song_path(@song)
        else
          render :new
        end
    end
    def update        
        @song = Song.find(params[:id])
        # binding.pry
        if @song.update(params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year))
            redirect_to song_path(@song)
        else
            render :edit
        end
    end
    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_url
    end
end
