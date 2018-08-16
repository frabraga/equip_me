class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_equipment, only: [:show, :edit, :destroy]

  def index
    @equipments = Equipment.all
    # @equipments.ratings
    # @rating_by_equip = {}
    # @equipments.each do |eq|
    #   count = 0
    #   @rating_by_equip[eq.id] ||= 0
    #   eq.bookings.each do |b|
    #     b.reviews.each do |r|
    #       @rating_by_equip[eq.id] += r.rating
    #       count += 1

    #       # @rating_by_equip[eq.id] ||= {}
    #       # @rating_by_equip[eq.id][:rating] ||= 0
    #       # @rating_by_equip[eq.id][:rating] += 1

    #       # @rating_by_equip[eq.id][:count] ||= 0
    #       # @rating_by_equip[eq.id][:count] += 1

    #     end
    #   end
    #   @rating_by_equip[eq.id] / count unless count == 0
    # end
    @equipments = policy_scope(Equipment).order(created_at: :desc)
  end

  def show
    authorize @equipment
    @booking = Booking.new
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    authorize @equipment
    if @equipment.save
      redirect_to @equipment
    else
      render :new
    end
  end

  def list
    @equipments = policy_scope(Equipment).order(created_at: :desc).where(user_id: current_user.id)
    authorize @equipments
  end

  def edit
  end

  def update
  end

  def destroy
    authorize @equipment
    @equipment.destroy
    redirect_to list_equipments_path
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price, :user_id, :photo)
  end
end
