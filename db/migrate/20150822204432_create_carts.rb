class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :order_status_id
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :shipping, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3

      t.timestamps
    end
  end
end
