class ChangeSizeToValueOrderItems < ActiveRecord::Migration
  def change
    rename_column :option_items, :size, :value
  end
end
