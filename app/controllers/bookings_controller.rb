class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :equipment_id, :start_date, :end_date)
  end
end
