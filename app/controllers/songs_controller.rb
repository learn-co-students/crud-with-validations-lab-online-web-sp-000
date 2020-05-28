class SongsController < ApplicationController
	before_action :set_song!, only: [:show, :edit, :update]


	def index
		@songs = Song.all
	end

	def new
		@song = Song.new
	end

	def show
	end

	def edit
	end

	def create
		@song = Song.new(post_params)

		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def update
		@song.assign_attributes(post_params)

		if @song.valid?
			@song.update(post_params)
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

	def post_params
		params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
	end

	def set_song!
		@song = Song.find(params[:id])
	end

end
