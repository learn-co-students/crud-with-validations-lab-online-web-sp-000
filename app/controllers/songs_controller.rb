class SongsController < ApplicationController

    def new
        @song = Song.new
    end

    def create
      @song = Song.new(song_params)
      
      respond_to do |format|
        if @song.save
          flash[:notice] = 'song was successfully created.'
          format.html { redirect_to(@song) }
          format.xml { render xml: @song, status: :created, location: @song }
        else
          format.html { render action: "new" }
          format.xml { render xml: @song.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
          flash[:success] = "song was successfully updated"
          redirect_to @song
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def index
        @songs = Song.all
    end
    
    def show
        @song = Song.find(params[:id])
    end

    def destroy
        @song = Song.find(params[:id])
        if @song.destroy
            flash[:success] = 'Song was successfully deleted.'
            redirect_to songs_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to songs_url
        end
    end
    
    
    
    private

    def song_params
        params.require(:song).permit(:title, :release_year,:released, :artist_name, :genre)
    end
    
end
