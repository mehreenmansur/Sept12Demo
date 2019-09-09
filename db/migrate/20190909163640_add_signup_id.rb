class AddSignupId < ActiveRecord::Migration
  def change
    add_column :items, :signup_id, :integer
  end
end
