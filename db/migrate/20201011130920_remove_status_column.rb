class RemoveStatusColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :following, :status, :boolean
  end
end
