class CreateEventPeople < ActiveRecord::Migration
  def change
    create_table :event_people do |t|
      t.string :name
      t.string :amount
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
