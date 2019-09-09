class AddDefaultValue < ActiveRecord::Migration
  def change
    change_column_default( :signup_items,
        :owner_type,
        'people'
    )
  end
end
