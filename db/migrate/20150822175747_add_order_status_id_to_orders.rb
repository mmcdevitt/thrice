class AddOrderStatusIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_status_id, :integer
  end
end
