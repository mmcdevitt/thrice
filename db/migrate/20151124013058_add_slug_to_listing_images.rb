class AddSlugToListingImages < ActiveRecord::Migration
  def change
    add_column :listing_images, :slug, :string
  end
end
