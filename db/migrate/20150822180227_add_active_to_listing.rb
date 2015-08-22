class AddActiveToListing < ActiveRecord::Migration
  def change
    remove_column :listings, :sold
    add_column :listings, :active, :boolean
  end
end
