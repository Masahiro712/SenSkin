class RemoveLifesyleIdFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :lifesyle_id, :integer
  end
end
