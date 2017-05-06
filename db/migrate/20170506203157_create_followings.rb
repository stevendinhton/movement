class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.string :user_id, null: false
      t.string :page_id, null: false
      t.timestamps
    end
  end
end
