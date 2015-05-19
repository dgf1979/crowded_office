class CreateCompaniesTable < ActiveRecord::Migration
  def change
    create_table(:companies) do |t|
      t.column(:name, :string)
      t.timestamps null: false
  end
end
end
