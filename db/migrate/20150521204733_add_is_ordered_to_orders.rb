class AddIsOrderedToOrders < ActiveRecord::Migration
  def change
    add_column(:orders, :is_ordered, :boolean)
  end
end
