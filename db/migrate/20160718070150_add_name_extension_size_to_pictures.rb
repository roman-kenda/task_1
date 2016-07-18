class AddNameExtensionSizeToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :string
    add_column :pictures, :extension, :string
    add_column :pictures, :size, :float
  end
end
