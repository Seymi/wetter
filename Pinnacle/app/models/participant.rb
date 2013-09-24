class Participant < ActiveRecord::Base
  attr_accessible :contestantnum, :event_game_number, :participant_name, :rotnum, :visiting_home_draw
  belongs_to :event
end
