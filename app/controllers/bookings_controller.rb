class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @equipment = Equipment.find_by(id: params[:id])
    @review = Review.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.equipment = Equipment.find(params[:equipment_id])
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

    def destroy
      @booking = Booking.find(params[:id])
      authorize @booking
      @booking.destroy
      redirect_to bookings_path
    end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :equipment_id, :start_date, :end_date)
  end
end
