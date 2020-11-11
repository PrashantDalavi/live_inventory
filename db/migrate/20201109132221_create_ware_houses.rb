class CreateWareHouses < ActiveRecord::Migration
  def change
    create_table :ware_houses do |t|
      t.string :name
      t.string :wh_code
      t.string :pincode
      t.integer :max_capacity

      t.timestamps
    end
  end
end
