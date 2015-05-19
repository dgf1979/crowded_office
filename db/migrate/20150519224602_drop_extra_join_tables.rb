class DropExtraJoinTables < ActiveRecord::Migration
  def change
    drop_table :companies_orders
    drop_table :lines_orders
  end
end
