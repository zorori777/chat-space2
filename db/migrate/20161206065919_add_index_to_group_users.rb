class AddIndexToGroupUsers < ActiveRecord::Migration[5.0]
  def change
   add_index :group_users, [:user_id,:group_id]

  end
end
