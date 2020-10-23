class ChangeColumnFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :username
    rename_column :users, :avatar, :photo
    rename_column :feelings, :user_id, :author_id
    rename_column :feelings, :body, :text
    rename_column :comments, :user_id, :author_id
  end
end
