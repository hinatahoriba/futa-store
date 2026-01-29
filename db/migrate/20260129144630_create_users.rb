class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :student_id, null: false, limit: 100
      t.string :name, null: false, limit: 100
      t.integer :balance, null: false, default: 0

      t.timestamps
    end

    add_index :users, :student_id, unique: true
  end
end
