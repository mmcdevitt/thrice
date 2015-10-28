class AddListingIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :listing_id, :integer
    remove_column :transactions, :order_item_id
  end
end
