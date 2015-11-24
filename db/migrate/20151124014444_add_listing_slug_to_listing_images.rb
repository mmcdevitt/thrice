class AddListingSlugToListingImages < ActiveRecord::Migration
  def change
    add_column :listing_images, :listing_slug, :string
  end
end
