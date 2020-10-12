class RenameFollowingToFollowings < ActiveRecord::Migration[6.0]
  def change
    rename_table :following , :followings
  end
end
