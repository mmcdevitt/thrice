class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :listing_id

      t.timestamps
    end
    add_attachment :images, :image
  end
end
