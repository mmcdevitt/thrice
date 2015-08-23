class AddSellerIdToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :seller_id, :integer
  end
end
