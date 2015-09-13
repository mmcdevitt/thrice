class AddItemsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :designer_name, :string
    add_column :listings, :size_id, :integer
    add_column :listings, :color, :string
    add_column :listings, :tags_attached, :boolean
    add_column :listings, :wear_and_tear, :boolean
    add_column :listings, :selling_price, :decimal, precision: 12, scale: 3
    add_column :listings, :published, :boolean
  end
end
