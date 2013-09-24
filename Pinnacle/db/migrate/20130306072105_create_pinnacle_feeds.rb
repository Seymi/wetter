class CreatePinnacleFeeds < ActiveRecord::Migration
  def change
    create_table :pinnacle_feeds do |t|
      t.integer :pinnacle_feed_time
      t.integer :last_contest
      t.integer :last_game
      t.string :sport_type
      t.string :sport_sub_type

      t.timestamps
    end
  end
end
