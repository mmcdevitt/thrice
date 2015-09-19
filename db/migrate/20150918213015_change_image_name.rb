class ChangeImageName < ActiveRecord::Migration
  def change
    rename_table :images, :listing_images
  end
end
