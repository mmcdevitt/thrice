class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :order_id
      t.integer :seller_id
      t.integer :buyer_id
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.boolean :payout, default: false
      t.integer :order_item_id

      t.timestamps
    end
  end
end
