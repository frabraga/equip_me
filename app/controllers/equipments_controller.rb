class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_equipment, only: [:show, :edit, :destroy]

  def index
    @equipments = Equipment.all
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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price, :user_id)
  end
end
