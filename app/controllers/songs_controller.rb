require 'pry'
class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params(params))
    binding.pry
    @song.save
    # if @song.valid?
    #     @song.save
    #     redirect_to song_path(@song)
    # else
    #   render :new
    # end
  end

  private

  def song_params(*args)
    params.permit(*args)
  end
end
