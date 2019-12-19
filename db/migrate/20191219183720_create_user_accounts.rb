class CreateUserAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_accounts do |t|
      t.string :person_id
      t.string :integer
      t.integer :legal_person_id
      t.integer :account_id
      t.boolean :branch_account

      t.timestamps
    end
  end
end
