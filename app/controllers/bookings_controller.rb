class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.artwork_id = params[:artwork_id]
    @booking.user_id = current_user.id
    if @booking.save
      flash[:notice] = "Your booking has been confirmed."
      redirect_to artwork_path(@booking.artwork)
    else
      render "artworks/show"
    end
  end

private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
