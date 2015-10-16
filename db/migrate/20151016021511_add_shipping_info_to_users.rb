class AddShippingInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
  end
end
