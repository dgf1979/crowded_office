class CreateTableOrdersLines < ActiveRecord::Migration
  def change
    create_table :orders_lines do |t|
      t.belongs_to :order, index: true
      t.belongs_to :line, index: true
  end
 end
end
