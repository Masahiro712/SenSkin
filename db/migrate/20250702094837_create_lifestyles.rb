class CreateLifestyles < ActiveRecord::Migration[7.1]
  def change
    create_table :lifestyles do |t|
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
