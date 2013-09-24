class ApplicationController < ActionController::Base
  protect_from_forgery

  def debug_logger
    #@@logger ||= ActiveSupport::BufferedLogger.new("#{RAILS_ROOT}/log/your_daemon.log")
    @@debug_logger ||= ActiveSupport::BufferedLogger.new("log/debug.log")
  end

  def app_logger
    #@@logger ||= ActiveSupport::BufferedLogger.new("#{RAILS_ROOT}/log/your_daemon.log")
    @@app_logger ||= ActiveSupport::BufferedLogger.new("log/app.log")
  end


end
