class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :primary_account_id
      t.string :type
      t.integer :secondary_account_id
      t.float :amount
      t.string :alphanumeric_code

      t.timestamps
    end
  end
end
