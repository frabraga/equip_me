class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_equipment, only: [:show, :edit, :destroy]

  def index
    if params[:query].present?
      @equipments = Equipment.search(params[:query])
    else
      @equipments = Equipment.all
    end

    #@equipments = policy_scope(Equipment).order(created_at: :desc)
    #@equipments = EquipmentPolicy::Scope.new(current_user, Equipment).abc(params[:query])
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

  protected

  def skip_pundit?
    controller_path == "equipments"
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price, :user_id, :photo)
  end
end
