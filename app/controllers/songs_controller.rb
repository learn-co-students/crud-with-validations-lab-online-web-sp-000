class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
		this_song
	end

	def edit
		this_song
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(strong_params)
		if @song.save
			redirect_to song_path(@song)
		else
			render :new
		end
		# binding.pry
	end

	def update
		this_song
		if @song.update(strong_params)
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

	private

	def this_song
		@song = Song.find(params[:id])
	end

	def strong_params
		params
			.require(:song)
			.permit(:title, :released, :release_year, :artist_name, :genre)
	end
end
