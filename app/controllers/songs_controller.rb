class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params.require(:id))
  end

  def edit
    @song = Song.find(params.require(:id))
  end

  def create
    @song = Song.create(params.require(:song).permit!)
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @results = Song.find(params.require(:id)).update(params.require(:song).permit!)
    # binding.pry
    if @results
      redirect_to Song.find(params.require(:id))
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params.require(:id))
    @song.destroy
    redirect_to songs_url
  end

  def new
    @song = Song.new
  end
end
