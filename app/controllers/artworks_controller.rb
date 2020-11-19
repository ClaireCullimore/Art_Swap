class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      sql_query = " \
      artworks.title @@ :query \
      OR artworks.artist @@ :query \
      "
      @artworks = Artwork.where(sql_query, query: "%#{params[:query]}%")
    else
    @artworks = Artwork.all
  end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @booking = Booking.new
    @artworks = Artwork.all.first(3)
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    if @artwork.save!
      redirect_to artwork_path(@artwork)
    else
      render :new
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist, :category, :description, :location, :price, photos: [])
  end
end
