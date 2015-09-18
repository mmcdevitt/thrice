class RemoveAttachmentFromListings < ActiveRecord::Migration
  def change
    remove_attachment :listings, :image
  end
end
