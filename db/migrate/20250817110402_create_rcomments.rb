class CreateRcomments < ActiveRecord::Migration[7.1]
  def change
    create_table :rcomments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
