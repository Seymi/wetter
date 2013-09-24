#!/usr/bin/env ruby
require 'rubygems'
require 'daemons'
#require 'event_machine'


class PinnacleFeedDaemon

  def initialize
    logger.auto_flushing = true
    logger.auto_flushing = 1
  end

  def dostuff
    logger.info "==================================================="
    logger.info " Pinnacle Feed gestartet: ".concat(Time.now.to_s)
    logger.info "==================================================="
    i = 0

    @feedReader = PinFeesController.new
    #@feedReader.initialize

    loop do
      i += 1
      logger.info "run already ".concat(i.to_s).concat(" times")
      args = {feed_time: 0, sport_type: '', sport_sub_type: '', last: nil }
      @feedReader.start_feed_as_daemon(args)
      logger.info "last feed time: ".concat(args[:feed_time].to_s)
      @feedReader.save_feed(args)
      #logger.flush

      sleep(60)
    end
    #EventMachine::run {
      # Your code here
    #}
  end

  def logger
    #@@logger ||= ActiveSupport::BufferedLogger.new("#{RAILS_ROOT}/log/your_daemon.log")
    @@logger ||= ActiveSupport::BufferedLogger.new("log/your_daemon.log")
  end
end

  dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  daemon_options = {
      :multiple   => false,
      :dir_mode   => :normal,
      :dir        => File.join(dir, 'tmp', 'pids'),
      :backtrace  => true
  }

  Daemons.run_proc('your_daemon', daemon_options) do
    if ARGV.include?('--')
      ARGV.slice! 0..ARGV.index('--')
    else
      ARGV.clear
    end

    Dir.chdir dir

    require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))
    PinnacleFeedDaemon.new.dostuff
  end
