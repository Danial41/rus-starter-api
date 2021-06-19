class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.date :birthday
      t.string :charachteristics

      t.timestamps
    end
  end
end
