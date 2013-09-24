class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :period_number
      t.string :period_description
      t.datetime :period_cutoff_datetimeGMT
      t.string :period_status
      t.string :period_update
      t.decimal :spread_maximum
      t.decimal :moneyline_maximum
      t.decimal :total_maximum
      t.integer :event_game_number

      t.timestamps
    end
  end
end
