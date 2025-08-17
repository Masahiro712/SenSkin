class CreateReviewRtagRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :review_rtag_relations do |t|
      t.references :review, null: false, foreign_key: true
      t.references :rtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
