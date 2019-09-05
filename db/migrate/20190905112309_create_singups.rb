class CreateSingups < ActiveRecord::Migration
  def change
    create_table :singups do |t|
      t.string :title, :null => false
      t.integer :schoolclass_id
      t.text :description
      t.text :description_html
      t.string :image
      t.boolean :is_all_day, :null => false, :default => 0
      t.datetime :start_date
      t.string :start_time
      t.datetime :end_date
      t.string :end_time
      t.boolean :all_rsvp_required, :null => false, :default => 1
      t.boolean :is_open_signup, :null => false, :default => 1
      t.boolean :is_published, :null => false, :default => 0
      t.datetime :published_at
      t.boolean :has_invite_sent, :null => false, :default => 0
      t.boolean :send_reminders, :null => false, :default => 1
      t.integer :signedup_reminder_days, :null => false, :default => -1
      t.boolean :notify_on_signup, :null => false, :default => 1
      t.boolean :has_event, :null => false, :default => 0
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
