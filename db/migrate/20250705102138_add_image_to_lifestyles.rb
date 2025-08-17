class AddImageToLifestyles < ActiveRecord::Migration[7.1]
  def change
    add_column :lifestyles, :image, :string
  end
end
