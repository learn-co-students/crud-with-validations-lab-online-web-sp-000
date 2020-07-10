class SongsController<ActionController::Base
 

  def show 
    @song=Song.find_by_id(params[:id])
  end

  def index
    @songs=Song.all 
  end

  def new
    @song=Song.new
  end
    
  def create
    @song=Song.create(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song=Song.find_by_id(params[:id])
  end

  def update
    @song=Song.find_by_id(params[:id])
    @song.update(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song=Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

end