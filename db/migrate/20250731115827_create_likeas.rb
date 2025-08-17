class CreateLikeas < ActiveRecord::Migration[7.1]
  def change
    create_table :likeas do |t|
      t.references :lifestyle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
