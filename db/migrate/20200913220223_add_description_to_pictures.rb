class AddDescriptionToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :description, :text
  end
end
