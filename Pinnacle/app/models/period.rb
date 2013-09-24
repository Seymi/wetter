class Period < ActiveRecord::Base
  attr_accessible :event_game_number, :moneyline_maximum, :period_cutoff_datetimeGMT, :period_description, :period_number, :period_status, :period_update, :spread_maximum, :total_maximum
  belongs_to :event
end
