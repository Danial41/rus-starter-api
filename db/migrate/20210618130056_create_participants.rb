class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
