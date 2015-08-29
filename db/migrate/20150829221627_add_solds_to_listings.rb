class AddSoldsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :sold, :boolean, default: false
  end
end
