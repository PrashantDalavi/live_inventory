class AddWareHouseIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ware_house_id, :integer
  end
end
