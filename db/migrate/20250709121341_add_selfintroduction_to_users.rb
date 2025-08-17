class AddSelfintroductionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :selfintroduction, :text
  end
end
