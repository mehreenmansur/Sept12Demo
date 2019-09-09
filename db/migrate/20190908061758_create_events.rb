class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :type
      t.string :welcome_message
      t.string :image
      t.string :file
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
