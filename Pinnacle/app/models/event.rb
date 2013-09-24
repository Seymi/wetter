class Event < ActiveRecord::Base
  attr_accessible :event_date_time_GMT, :game_number, :is_live, :leage, :sport_type
  has_many :participants
  has_many :periods

end
