class CreateLcomments < ActiveRecord::Migration[7.1]
  def change
    create_table :lcomments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :lifestyle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
