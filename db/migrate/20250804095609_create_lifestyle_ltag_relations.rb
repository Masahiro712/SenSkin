class CreateLifestyleLtagRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :lifestyle_ltag_relations do |t|
      t.references :lifestyle, null: false, foreign_key: true
      t.references :ltag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
