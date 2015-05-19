class CreateTableLines < ActiveRecord::Migration
  def change
    create_table(:lines) do |t|
      t.column(:supply_id, :int)
      t.column(:quantity, :int)
      t.timestamps null: false
  end
 end
end
