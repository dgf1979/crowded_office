class CreateTableLinesOrders < ActiveRecord::Migration
  def change
      create_table :lines_orders do |t|
        t.belongs_to :line, index: true
        t.belongs_to :order, index: true
  end
 end
end
