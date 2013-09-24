class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_date_time_GMT
      t.integer :game_number
      t.string :sport_type
      t.string :leage
      t.boolean :is_live

      t.timestamps
    end
  end
end
