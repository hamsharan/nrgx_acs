class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.integer :sin
      t.string :full_name
      t.datetime :birthDate

      t.timestamps
    end
  end
end
