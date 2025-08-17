class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :item
      t.integer :price
      t.text :url
      t.text :comment
      t.datetime :time

      t.timestamps
    end
  end
end
