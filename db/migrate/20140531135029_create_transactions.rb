class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :dt
      t.integer :account_id
      t.float :amount
      t.text :remark
      t.string :transaction_type

      t.timestamps
    end
  end
end
