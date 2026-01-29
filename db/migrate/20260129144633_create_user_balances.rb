class CreateUserBalances < ActiveRecord::Migration[8.0]
  def change
    create_table :user_balances do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :value, null: false
      t.integer :balance_type, null: false

      t.timestamps
    end
  end
end
