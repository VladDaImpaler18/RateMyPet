class RemoveFilenameFromPictures < ActiveRecord::Migration[6.0]
  def change
    remove_column :pictures, :filename, :string
  end
end
