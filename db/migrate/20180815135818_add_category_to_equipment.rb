class AddCategoryToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :category, :string
  end
end
