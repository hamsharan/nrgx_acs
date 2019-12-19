class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.boolean :branch_account
      t.integer :parent_account_id
      t.float :balance
      t.string :status

      t.timestamps
    end
  end
end
