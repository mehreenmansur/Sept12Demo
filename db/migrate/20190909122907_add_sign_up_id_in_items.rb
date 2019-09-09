class AddSignUpIdInItems < ActiveRecord::Migration
  def change
    add_column :signup_items, :signup_id, :integer
  end
end
