class CreateTableSupplies < ActiveRecord::Migration
  def change
    create_table(:supplies) do |t|
      t.column(:name, :string)
      t.timestamps null: false
  end
 end
end
