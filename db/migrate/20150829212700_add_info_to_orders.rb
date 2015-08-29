class AddInfoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :second_address, :string
    add_column :orders, :zipcode, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :cc_name, :string
    add_column :orders, :cc_number, :string
    add_column :orders, :expiry_month, :string
    add_column :orders, :expiry_year, :string
    add_column :orders, :cc_cvv, :string
  end
end
