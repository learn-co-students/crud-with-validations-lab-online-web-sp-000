class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
  end

  def destroy
    @song = Song.find(params[:id])
  end

end
