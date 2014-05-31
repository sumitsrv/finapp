class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, :null => false
      t.string :type
      t.float :balance, :default => 0.0

      t.timestamps
    end
  end
end
