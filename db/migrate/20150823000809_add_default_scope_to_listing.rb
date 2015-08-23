class AddDefaultScopeToListing < ActiveRecord::Migration
  def change
    change_column :listings, :active, :boolean, default: true
  end
end
