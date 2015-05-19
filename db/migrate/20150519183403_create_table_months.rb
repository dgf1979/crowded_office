class CreateTableMonths < ActiveRecord::Migration
  def change
    create_table(:months) do |t|
      t.column(:name, :string)
      t.timestamps null:false
  end
 end
end
