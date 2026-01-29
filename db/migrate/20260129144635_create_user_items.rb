class CreateUserItems < ActiveRecord::Migration[8.0]
  def change
    create_table :user_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :price, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
