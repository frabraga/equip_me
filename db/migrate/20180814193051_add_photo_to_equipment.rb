class AddPhotoToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :photo, :string
  end
end
