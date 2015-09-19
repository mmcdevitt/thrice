class ChangeAttachmentNameInListings < ActiveRecord::Migration
  def change
    remove_attachment :listing_images, :image
    add_attachment :listing_images, :listing_image
  end
end
