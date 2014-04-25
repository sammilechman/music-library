class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end


  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end


  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end


  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album \"#{@album.title}\" created!"
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messsages
      render :new
    end
  end


  def edit
    @album = Album.find_by_id(params[:id])
    @bands = Band.all
    render :edit
  end


  def update
    @album = Album.find_by_id(params[:id])
    @album.update(album_params)
    if @album.save
      flash[:notice] = "Album \"#{@album.title}\" updated!"
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messsages
      render :edit
    end
  end


  def destroy
    @album = Album.find_by_id(params[:id])
    if @album.delete
      flash[:notice] = "Album \"#{@album.title}\" deleted!"
      redirect_to bands_url
    else
      flash.now[:errors] = @album.errors.full_messages
      render album_url(@album.id)
    end
  end


  private


  def album_params
    params.require(:album).permit(:title, :band_id, :live)
  end


end
