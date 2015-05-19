class RemoveOrdersLinesTable < ActiveRecord::Migration
  def up
    drop_table :orders_lines
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
