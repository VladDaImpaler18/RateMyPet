class AddCategoryIdToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :category_id, :integer
  end
end
