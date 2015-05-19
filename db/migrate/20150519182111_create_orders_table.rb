class CreateOrdersTable < ActiveRecord::Migration
  def change
    create_table(:orders) do |t|
      t.column(:month_id, :int)
      t.timestamps null:false
  end
end
end
