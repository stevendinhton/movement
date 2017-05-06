class AddUserIdToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :user_id, :integer
  end
end
