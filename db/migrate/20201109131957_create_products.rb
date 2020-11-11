class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku_code
      t.float :price
      t.integer :low_item_threshold

      t.timestamps
    end
  end
end
