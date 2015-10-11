class AddCategoryIdToOptionItems < ActiveRecord::Migration
  def change
    add_column :option_items, :category_id, :integer
  end
end
