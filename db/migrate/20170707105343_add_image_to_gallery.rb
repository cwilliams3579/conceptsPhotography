class AddImageToGallery < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :images, :string, array: true, default: [].to_yaml
  end
end
