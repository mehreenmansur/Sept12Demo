class CreateSignupItems < ActiveRecord::Migration
  def change
    create_table :signup_items do |t|
      t.string :owner_type, :null => false
      t.integer :owner_id, :null => false
      t.text :title, :null => false
      t.integer :item_type
      t.integer :quantity
      t.integer :achieved_quantity, :null => false, :default => 0
      t.datetime :due_date
      t.string :due_time
      t.text :description
      t.integer :sort_order, :null => false, :default => 0
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
