class AddSlugToListings < ActiveRecord::Migration
  def change
    add_column :listings, :slug, :string
  end
end
