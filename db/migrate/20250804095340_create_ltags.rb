class CreateLtags < ActiveRecord::Migration[7.1]
  def change
    create_table :ltags do |t|
      t.string :name

      t.timestamps
    end
  end
end
