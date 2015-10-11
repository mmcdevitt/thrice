class AddOptionsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :option_id, :integer
    add_column :listings, :option_item_id, :integer
  end
end
