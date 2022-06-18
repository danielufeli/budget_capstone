class CreateCategoryTran < ActiveRecord::Migration[7.0]
   def change
    create_table :category_trans do |t|
      t.bigint :tran_id, null: false
      t.bigint :category_id, null: false

      t.timestamps
    end
    add_index :category_trans, :tran_id
    add_foreign_key :category_trans, :trans, column: :tran_id
    add_index :category_trans, :category_id
    add_foreign_key :category_trans, :categories, column: :category_id
  end
end
