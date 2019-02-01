class AlbumsController < ApplicationController

  def new
    @album = Album.new(band_id: params[:band_id])
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    @band = Band.find_by(id: album_params[:band_id])
    
    if @album.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])

    if album.update(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      render :edit
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    album.destroy
    redirect_to band_url(album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :studio, :year)
  end
end
