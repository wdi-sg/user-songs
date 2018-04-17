class SongsController < ActionController

  def index
    @songs = Song.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  def show
    @song = Song.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @song }
    end
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render 'new'
    end
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(article_params)
      redirect_to @song
    else
      render 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to articles_path
  end

  private
    def song_params
      params.require(:song).permit(:title)
    end
end
