class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end


  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end


  def new
    @band = Band.new
    render :new
  end


  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "Band \"#{@band.name}\" created!"
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = @band.errors.full_messsages
      render :new
    end
  end


  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end


  def update
    @band = Band.find_by_id(params[:id])
    @band.update(band_params)
    if @band.save
      flash[:notice] = "Band \"#{@band.name}\" updated!"
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = @band.errors.full_messsages
      render :edit
    end
  end


  def destroy
    @band = Band.find_by_id(params[:id])
    if @band.delete
      flash[:notice] = "Band \"#{@band.name}\" deleted!"
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render band_url(@band.id)
    end
  end


  private


  def band_params
    params.require(:band).permit(:name)
  end


end
