class DropCompanieIdColumn < ActiveRecord::Migration
  def up
    drop_table :companies_orders
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
