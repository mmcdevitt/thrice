class RemoveListingIdToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :listing_id
  end
end
