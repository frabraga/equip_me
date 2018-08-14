class ReviewsController < ApplicationController
before_action :set_booking

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = set_booking
    if @review.save
      redirect_to @booking
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Booking was successfully destroyed.' }
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:booking_id, :description, :rating)
end
