class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_equipment, only: [:show, :destroy]

  def index
    if params[:query].present?
      @equipments = Equipment.search(params[:query])
    else
      @equipments = Equipment.all
    end
    @markers = markers
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

  def search
    @equipments = policy_scope(Equipment).order(created_at: :desc).search(params[:query])
    @markers = markers

    respond_to do |format|
      format.html
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def list
    @equipments = policy_scope(Equipment).order(created_at: :desc).where(user_id: current_user.id)
    authorize @equipments
  end

  def edit
    @equipment = Equipment.find_by(id: params[:id])
  end

  def update
    @equipment = Equipment.find_by(id: params[:id])
    @equipment.update(equipment_params)
    redirect_to equipment_path
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

  def markers
    @equipments.map do |equipment|
      {
        lat: equipment.user.latitude,
        lng: equipment.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price, :category, :user_id, :photo)
  end
end
