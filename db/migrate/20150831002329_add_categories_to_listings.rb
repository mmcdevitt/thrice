class AddCategoriesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :category_id, :integer
  end
end
