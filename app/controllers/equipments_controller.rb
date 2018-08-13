class EquipmentsController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :destroy]

  def index
    @equipment = Equipment.all
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
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
