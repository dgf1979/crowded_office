class CreateTableCompaniesOrders < ActiveRecord::Migration
  def change
    create_table :companies_orders do |t|
      t.belongs_to :companie, index: true
      t.belongs_to :order, index: true
    end
  end
end
