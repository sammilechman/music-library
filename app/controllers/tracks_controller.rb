class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end


  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end


  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end


  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:notice] = "Track \"#{@track.title}\" created!"
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messsages
      render :new
    end
  end


  def edit
    @track = Track.find_by_id(params[:id])
    @albums = Album.all
    render :edit
  end


  def update
    @track = Track.find_by_id(params[:id])
    @track.update(track_params)
    if @track.save
      flash[:notice] = "Track \"#{@track.title}\" updated!"
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messsages
      render :edit
    end
  end


  def destroy
    @track = Track.find_by_id(params[:id])
    if @track.delete
      flash[:notice] = "Track \"#{@track.title}\" deleted!"
      redirect_to tracks_url
    else
      flash.now[:errors] = @track.errors.full_messages
      render track_url(@track.id)
    end
  end


  private


  def track_params
    params.require(:track).permit(:title, :album_id, :bonus, :lyrics)
  end


end
