class SongsController < ApplicationController
  #must do user login expect for the methods() show and index is acessible.
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @songs = Song.all

    #if user logged in run this code below
    if user_signed_in?
      # @song = Song.find(params[:id])
      # @song.user # => User Object User.find(1)

      @user = current_user # => User.find(1)
    
      @selected = @user.songs # => [songs that belong to user]
    else
      @selected = []
    end

    # else index botak
  

    
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
      @song.users << current_user
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




# an Author has many books 
# each book belongs to an author 
# @author = Author.find(1)
# @author.books 
# @book = Book.find(1)
# @book.author 
