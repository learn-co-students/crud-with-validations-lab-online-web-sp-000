class SongsController < ApplicationController
  before_action :find_instance, only: [:show, :edit, :update, :destroy]

  def index
    
  end

  def show
    
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  def find_instance
    @song = Song.find(params[:id])
  end

end
