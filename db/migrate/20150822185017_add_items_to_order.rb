class AddItemsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :subtotal, :decimal, precision: 12, scale: 3
    add_column :orders, :tax, :decimal, precision: 12, scale: 3
    add_column :orders, :shipping, :decimal, precision: 12, scale: 3
    add_column :orders, :total, :decimal, precision: 12, scale: 3
  end
end
