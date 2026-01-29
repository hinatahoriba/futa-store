class CreateSupplements < ActiveRecord::Migration[8.0]
  def change
    create_table :supplements do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
