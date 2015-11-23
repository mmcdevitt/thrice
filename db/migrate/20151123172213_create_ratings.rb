class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :listing_id
      t.integer :feedback_id
      t.text :comment

      t.timestamps
    end
  end
end
