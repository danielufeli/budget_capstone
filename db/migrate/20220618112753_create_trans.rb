class CreateTrans < ActiveRecord::Migration[7.0]
  def change
    create_table :trans do |t|
      t.string :name
      t.decimal :amount
      t.bigint :author_id, null: false

      t.timestamps
    end
    add_index :trans, :author_id
    add_foreign_key :trans, :users, column: :author_id
  end
end
