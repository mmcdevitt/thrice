class AddBestOfferToListings < ActiveRecord::Migration
  def change
    add_column :listings, :best_offer, :boolean
  end
end
