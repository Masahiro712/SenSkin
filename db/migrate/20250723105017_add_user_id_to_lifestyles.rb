class AddUserIdToLifestyles < ActiveRecord::Migration[7.1]
  def change
    add_column :lifestyles, :user_id, :integer
  end
end
