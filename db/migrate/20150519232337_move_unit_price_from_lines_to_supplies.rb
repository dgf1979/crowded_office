class MoveUnitPriceFromLinesToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :unit_price, :decimal
  end
end
