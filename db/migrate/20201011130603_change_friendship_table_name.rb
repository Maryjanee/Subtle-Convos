class ChangeFriendshipTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :friendships, :following
    
  end
end
