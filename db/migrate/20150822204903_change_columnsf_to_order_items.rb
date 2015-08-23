class ChangeColumnsfToOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :order_id
    add_column :order_items, :cart_id, :integer


  end
end
