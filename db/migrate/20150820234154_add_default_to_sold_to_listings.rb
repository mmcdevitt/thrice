class AddDefaultToSoldToListings < ActiveRecord::Migration
  def change
    remove_column :listings, :sold
    add_column :listings, :sold, :boolean, default: false
  end
end
