class PinnacleFeed < ActiveRecord::Base
  attr_accessible :last_contest, :last_game, :pinnacle_feed_time, :sport_sub_type, :sport_type

  require 'open-uri'

  pinnacle_feed_link = "http://xml.pinnaclesports.com/pinnacleFeed.aspx"

  def read_feed (sport_type, sport_sub_type, last)
    expand_uri = '?'
    expand_uri_joiner = ''
    if sport_type != nil
      expand_uri.concat("SportType=").concat(sport_type)
      expand_uri_joiner = '&'
    end
    if sport_sub_type != nil
      expand_uri.concat(expand_uri_joiner).concat("SportSubType=").concat(sport_sub_type)
      expand_uri_joiner = '&'
    end
    if last != nil
      expand_uri.concat(expand_uri_joiner).concat("last=").concat(last)
    end

    reponse = open(pinnacle_feed_link.concat(expand_uri)).read

    return response

  end


end
