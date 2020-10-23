class CreateFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :feelings do |t|
      t.text :body
      t.references :user
      t.timestamps
    end
  end
end
