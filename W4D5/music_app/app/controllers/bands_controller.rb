class BandsController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] = band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    band = Band.find_by(id: params[:id])

    if band.update(band_params)
      redirect_to band_url(band)
    else
      flash[:errors] = user.errors.full_messages
      render :edit
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])

    band.delete
    render :index
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
