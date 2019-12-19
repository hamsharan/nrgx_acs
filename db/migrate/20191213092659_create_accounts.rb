class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.boolean :branch_account
      t.integer :parent_account_id
      t.integer :person_id
      t.integer :legal_person_id
      t.float :balance

      t.timestamps
    end
  end
end
