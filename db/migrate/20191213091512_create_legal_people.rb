class CreateLegalPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :legal_people do |t|
      t.integer :FBN
      t.string :companyName
      t.string :fantasy_name

      t.timestamps
    end
  end
end
