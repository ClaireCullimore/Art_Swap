class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @artworks = Artwork.all
    if params[:query].present?
      sql_query = " \
      artworks.title @@ :query \
      OR artworks.artist @@ :query \
      "

      @artworks = Artwork.where(sql_query, query: "%#{params[:query]}%")
    else
      @artworks = Artwork.all
      @artworks = @artworks.where(sql_query, query: "%#{params[:query]}%")
    end
    if params[:artworks].present?
      @artworks = @artworks.where(category: params[:artworks])
    end
    if params[:min_price].present? && params[:max_price].present?
      @artworks = @artworks.where("price > ? AND price < ?", params[:min_price].to_i, params[:max_price].to_i)
    end

    @markers = @artworks.geocoded.map do |artwork|
      {
        lat: artwork.latitude,
        lng: artwork.longitude
      }
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
