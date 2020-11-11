class AddItemCountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :item_count, :integer
  end
end
