class CreateOptionItems < ActiveRecord::Migration
  def change
    create_table :option_items do |t|
      t.string :size
      t.integer :option_id

      t.timestamps
    end
  end
end
