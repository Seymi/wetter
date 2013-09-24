class PinFeesController < ApplicationController

  require 'open-uri'

  @sport_types = ['Basketball','Hockey', 'Soccer']


  #def initialize
  #  debug_logger.auto_flushing = true
  #  debug_logger.auto_flushing = 1
  #end

  def no_feed

  end


  #def read_feed (:sport_type, :sport_sub_type, :feed_time)
  def read_feed(args)

    debug_logger.info Time.now.to_s.concat(" => read_feed startet")

    pinnacle_feed_link = "http://xml.pinnaclesports.com/pinnacleFeed.aspx"

    @sport_type = args[:sport_type]
    @sport_sub_type = args[:sport_sub_type]
    @event = args[:event]

    #@feed_time = params[:feed_time]
    #@feed_time = '1362582479720'

    #@feed_time = @feed_time
    #@feed_time = args[:feed_time]
    @feed_time = args[:feed_time]


    expand_uri = '?'
    expand_uri_joiner = ''
    if @sport_type != nil
      expand_uri.concat("SportType=").concat(@sport_type)
      expand_uri_joiner = '&'
    end
    unless @sport_sub_type.empty?
      expand_uri.concat(expand_uri_joiner).concat("SportSubType=").concat(@sport_sub_type)
      expand_uri_joiner = '&'
    end

    #if @feed_time != nil
    unless @feed_time.nil?
      expand_uri.concat(expand_uri_joiner).concat("last=").concat(@feed_time.to_s)
    end

    response = open(pinnacle_feed_link.concat(expand_uri)).read

    h = Hash.from_xml (response)

    @feed_time    = h["pinnacle_line_feed"]["PinnacleFeedTime"]
    @last_contest = h["pinnacle_line_feed"]["lastContest"]
    @last_game    = h["pinnacle_line_feed"]["lastGame"]

    @events = h["pinnacle_line_feed"]["events"]["event"]

    debug_logger.info Time.now.to_s.concat(" => events to read: ")
    debug_logger.info "EXPAND_URI: ".concat(expand_uri)
    debug_logger.info "sport_subtype: ".concat(@sport_sub_type)

    unless @feed_time.nil?
      debug_logger.info "last: ".concat(@feed_time)
    end

    #debug_logger.flush


    args[:feed_time]=@feed_time
    args[:last_contest]=@last_contest
    args[:last_game]=@last_game

    args[:feed_time] = @feed_time

    args[:events]=@events

  end


  def start_feed
    @feed = PinnacleFeed.last

    @feed_time    = @feed.pinnacle_feed_time
    @last_contest = @feed.last_contest
    @last_game    = @feed.last_game
    @sport_type   = @feed.sport_type

    #args[:last_contest]=@last_contest
    #args[:last_game]=@last_game


    @events = params[:events]
    args = {}
    args[:events]=@events
    args[:feed_time]=@feed_time
    args[:sport_type]=@sport_type



  end


  def start_feed_as_daemon(args)
    @feed = PinnacleFeed.last

    @feed_time    = @feed.pinnacle_feed_time
    @last_contest = @feed.last_contest
    @last_game    = @feed.last_game
    @sport_type   = @feed.sport_type

    args[:feed_time]=@feed_time
    args[:last_contest]=@last_contest
    args[:last_game]=@last_game
    args[:sport_type]=@sport_type
    args[:events]=@events
  end


  def save_feeder
    @sport_type     = params[:sport_type]
    @sport_sub_type = params[:sport_sub_type]
    @events         = params[:events]

    @feed_time      = params[:feed_time]
    #@feed_time      = @feed.pinnacle_feed_time


    #debug_logger.info "in save_feeder feed_time : ".concat(@feed_time)

    args = {}
    args[:sport_type]=@sport_type
    args[:sport_sub_type]=@sport_sub_type
    args[:events]=@events
    args[:feed_time]=@feed_time

    save_feed(args)
    redirect_to pin_fees_start_feed_path notice: 'Data Feed wurde erfolgreich gespeichert.'
  end


  def save_feed(args)
    read_feed(args)
    @feed = PinnacleFeed.create({ :pinnacle_feed_time => @feed_time, :last_contest => @last_contest, :last_game => @last_game, :sport_type => @sport_type, :sport_sub_type => @sport_sub_type })

    if not @events.nil?
      events_in_feed = 0
      events_new = 0

      @events.each do |e|
        events_in_feed += 1
        if not Event.find_by_game_number(e["gamenumber"])
          Event.create({ :event_date_time_GMT => e["event_datetimeGMT"], :game_number => e["gamenumber"], :sport_type => e["sporttype"], :leage => e["league"], :is_live => e["IsLive"] })
          events_new += 1
          # entweder bereits hier oder erst nach dem end die participants hinzufuegen
          @participants = e["participants"]["participant"]
          if not @participants.nil?
            @participants.each do |p|
              #debug_logger.info p["participant_name"]
              Participant.create ( { :event_game_number => e["gamenumber"], :participant_name => p["participant_name"], :contestantnum => p["contestantnum"], :rotnum => p["rotnum"], :visiting_home_draw => p["visiting_home_draw"] })
              #Participant.create ( { :event_game_number => game_num, :participant_name => p["participant_name"] })
            end
          end

        end


        # change this @periods = e["periods"]  und dann @periods.each do

        @periods = e["periods"]["period"]
        #@periods = e["periods"]

        debug_logger.info @periods
        if not @periods.nil?
          if not @periods.empty?
            #@periods.each do |peri|
              Period.create ( { :event_game_number => e["gamenumber"], :period_number => @periods["period_number"], :period_description => @periods["period_description"], :period_cutoff_datetimeGMT => @periods["periodcutoff_datetimeGMT"], :period_status => @periods["period_status"], :period_update => @periods["period_update"], :spread_maximum => @periods["spread_maximum"], :moneyline_maximum => @periods["moneyline_maximum"], :total_maximum => @periods["total_maximum"] } )
              #Period.create ( { :event_game_number => e["gamenumber"], :period_description => @periods["period_description"]  } )
              #Period.create ( { :event_game_number => e["gamenumber"] } )

              #debug_logger.info peri["period_description"]
            #end
          end
        end

      end

      debug_logger.info "neue events: ".concat(events_new.to_s).concat(" von ").concat(events_in_feed.to_s)
    else
      debug_logger.info "keine neue events. "
    end

    #debug_logger.flush

  end

end

#require 'open-uri'
#response = open("http://xml.pinnaclesports.com/pinnacleFeed.aspx?sportType=Basketball").read
#response = open("http://xml.pinnaclesports.com/pinnacleFeed.aspx?sportType=Basketball&last=1363266950332").read

#h = Hash.from_xml (response)

#@events = h["pinnacle_line_feed"]["events"]["event"]

#@events.each do |e|
#  puts e["gamenumber"]
#end
